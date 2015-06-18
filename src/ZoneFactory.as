package src
{
	import flash.display.MovieClip;

	/*
		Static class that obtains new Zones for player navigation
	*/
	public class ZoneFactory
	{


		public function ZoneFactory(){}

		

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
				//For testing... All squares
				case 0:
					zoneTitle = "Test Zone 0";
					for(i = 0; i < Constants.NUMBER_OF_TILES_X; i++)
					{
						for(j = 0; j < Constants.NUMBER_OF_TILES_Y; j++)
						{
							visuLocation[i].push(new SimpleGrass());
						}
					}
				break;
				
					
				case 1:
					zoneTitle = "Test Zone 1";
					for(i = 0; i < Constants.NUMBER_OF_TILES_X; i++)
					{
						for(j = 0; j < Constants.NUMBER_OF_TILES_Y; j++)
						{
							if( i % 2 == 0 )
							{
								visuLocation[i].push(new SimpleGrass());
							}
							else
							{
								visuLocation[i].push(new SimpleRock());
							}
						}
					}
				break;

				case 2:
					zoneTitle = "Test Zone 2";
					visuLocation = ZoneVisualBank.test_zone_2;
				break;


				/*
					To create a new zone use
					case 'NEXT NUMBER'
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