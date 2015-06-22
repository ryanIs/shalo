package bin
{
	import bin.actors.*;
	import flash.utils.setTimeout;

	/*
		The primary controller class for Campaign mode
	*/
	public class CampaignDriver extends Driver
	{

		private var zone:Zone;
		private var hero:Hero;

		public function CampaignDriver(){}

		/*
			The initializer function for initializing the campaign  mode
		*/	
		override public function run()
		{
			var presetZoneNumber:Number = 0;
			zone = (ZoneFactory.getZone(presetZoneNumber));
			zone.load();

			hero = new Hero(Constants.CLASS_FIGHTER);
			hero.spawn(4, 4);


		}


	}
}