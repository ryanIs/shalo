﻿package bin
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

			hero = new Hero(Constants.CLASS_FIGHTER);
			var presetZoneNumber:Number = 0;
			zone = (ZoneFactory.getZone(presetZoneNumber));
			zone.load();
			zone.addHero(hero, 2, 4);


		}

		/*
			Transition between zones
		*/
		public function zoneTransition(nextZoneIdentificationNumber:Number, heroLocation:Array):void
		{
			zone.clear();

			zone = ZoneFactory.getZone(nextZoneIdentificationNumber);
			
			zone.load();

			zone.moveHeroTo(hero, heroLocation[0], heroLocation[1]);
		}


		public function getZone():Zone
		{
			return zone;
		}

		public function getHero():Hero
		{
			return hero;
		}


	}
}