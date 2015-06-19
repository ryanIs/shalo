package bin
{

	import flash.utils.setTimeout;

	/*
		The primary controller class for Campaign mode
	*/
	public class CampaignDriver extends Driver
	{

		private var zone:Zone;

		public function CampaignDriver(){}

		/*
			The initializer function for initializing the campaign  mode
		*/	
		override public function run()
		{
			//LOAD CHARACTER DATA HERE
			//mock data
			var presetZoneNumber:Number = 0;

			zone = (ZoneFactory.getZone(presetZoneNumber));
			zone.load();
		}


	}
}