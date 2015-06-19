package src
{
	import flash.display.MovieClip;

	/*
		Static class that obtains new Zones for player navigation
	*/
	public class ZoneFactory
	{
		//ZONE AREA CONSTANTS 
		private static const IXEL_FIELDS:Number = 0;
			private static const IXEL_FIELDS_ROADS_END:Number = 0;
			private static const IXEL_FIELDS_PATH_0:Number = 1;

		public function ZoneFactory(){}

		/*
			obtains a new zone to be rendered
			presetZoneNumber : a predetermined zoneNumber, if just logging in, or switch zones
			zoneArea : the representation of what zone we are in 'Ixel Forest', 'Town', 'dark cavern'
			currentZoneNumber : the current zone we are in represented as a number
			direction : the direction we are travelling represented as a number (this could be N S E W or into buildings or anyother area of travel)
		*/
		public static function getZone(presetZoneNumber:Number = -1, zoneArea:Number = -1, currentZoneNumber:Number = -1, direction:Number = -1):Zone
		{
			var zoneIdentificationNumber:Number = presetZoneNumber;
			
			//if we do not know where we are travelling preemtively (just spawned, or switching zones)
			if(zoneIdentificationNumber == -1)
			{
				//which zone area
				switch(zoneArea)
				{
					//ALL ZONES WITHIN IXEL FIELDS
					case IXEL_FIELDS:

						//which zone
						switch(currentZoneNumber)
						{
							//ALL DIRECTIONS YOU COULD GO WITHIN IXEL_FIELDS_ROADS_END ZONE
							case IXEL_FIELDS_ROADS_END:

								//which direction are we going from here
								switch(direction)
								{
									//up, down, left, right
									case 0:
										zoneIdentificationNumber = IXEL_FIELDS_PATH_0;
									case 1:
									case 2:
									case 3:
									break;
								}
							break;
							case IXEL_FIELDS_PATH_0:
								switch(direction)
								{
									//up
									case 0:

									break;
									//down
									case 1:
										zoneIdentificationNumber = IXEL_FIELDS_ROADS_END;
									break;
								}
							break;
						}
					break;
				}
			}


			return ZoneFactory.zone(zoneIdentificationNumber);
		}

		/*
			Obtains a new Zone to be rendered
			newZoneNumber: The zone number that represents the next area
		*/
		public static function zone(newZoneNumber:Number):Zone
		{
			var zone:Zone;
			var visuLocation:Array = [];
			var charLocation:Array = [];
			var tileWidth:Number = 900 / Constants.NUMBER_OF_TILES_X;
			var tileHeight:Number = 650 / Constants.NUMBER_OF_TILES_Y;
			var tile:MovieClip;
			var i:Number;
			var j:Number;
			var zoneTitle:String;
			
			/*
				Initialize array
			*/
			for(i = 0; i < Constants.NUMBER_OF_TILES_X; i++)
			{
				visuLocation.push(new Array());
				charLocation.push(new Array());
			}

			/*
				Based on the zone number, create the list of visuals and characters in each zone
			*/
			switch(newZoneNumber)
			{
				case 0:
					zoneTitle = "Ixel Fields Roads End";
					visuLocation = ZoneVisualBank.IXEL_FIELDS_ROADS_END;
				break;
				case 1:
					zoneTitle = "Ixel Fields Path";
					visuLocation = ZoneVisualBank.IXEL_FIELDS_PATH_0;
				break;


				/*
					To create a new zone use
					case 'NEXT NUMBER':
						zoneTitle = '';
						visuLocation = ...
						charLocation = ...
					break;
				*/


			}

			/*
				Place each tile at it's designated location and add them to the root
			*/
			for(i = 0; i < Constants.NUMBER_OF_TILES_X; i++)
			{
				for(j = 0; j < Constants.NUMBER_OF_TILES_Y; j++)
				{
					tile = visuLocation[j][i];
					tile.x = tileWidth * i;
					tile.y = tileHeight * j;
					tile.width = tileWidth;
					tile.height = tileHeight;
					MainSingleton.get().addChild(tile);
				}
			}

			//create the zone
			zone = new Zone(zoneTitle, visuLocation, charLocation);

			return zone;
		}
	}
}