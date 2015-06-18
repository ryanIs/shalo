package src
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.setTimeout;

	public class Main extends MovieClip
	{
		public var LOAD_COMPLETE:Boolean = false;
		public var transition_frame:String = "load";
		public function Main()
		{
			if(!LOAD_COMPLETE) {
				bar_mc.bar_mc.scaleX = 0;
				loaderInfo.addEventListener(ProgressEvent.PROGRESS, loadHandler);
			}
			stop();
			//MainSingleton.set(this);

			//ZoneFactory.zone(2);

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
				play();
			}
			return;
		}
	}
}
