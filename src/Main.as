package src
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip
	{
		public var LOAD_COMPLETE:Boolean = false;
		public var transition_frame:String = "load";
		private const DEBUG:Boolean = true;


		public function Main()
		{
			//The main
			CoreAccessor.setMain(this);
			if(!LOAD_COMPLETE) {
				bar_mc.bar_mc.scaleX = 0;
				loaderInfo.addEventListener(ProgressEvent.PROGRESS, loadHandler);
			}
			stop();
		}
		public function trans(to_frame:String):void {
			transition_frame = to_frame;
			if(trans_mc != null) {
				trans_mc.gotoAndPlay(2);
			}
			return;
		}
		public function loadHandler(e:ProgressEvent):void {
			var load_progress:Number = e.bytesLoaded / e.bytesTotal;
			bar_mc.bar_mc.scaleX = load_progress;
			if(load_progress == 1.00) {
				loaderInfo.removeEventListener(ProgressEvent.PROGRESS, loadHandler);
				LOAD_COMPLETE = true;
				if(DEBUG)
				{
					selectDriver(Constants.CAMPAIGN_MODE);
				}
				else
				{
					play();
				}
			}
			return;
		}

		/*
			Selects the operating class to control the games functionality
		*/
		private function selectDriver(driver:Number)
		{
			switch(driver)
			{
				case Constants.CAMPAIGN_MODE:
					CoreAccessor.setDriver(new CampaignDriver());
				break;
				case Conastants.ONLINE_MODE:
					CoreAccessor.setDriver(new OnlineDriver());

				break;
			}
		}
	}
}
