package src
{
	import flash.display.MovieClip;

	/*
		Represents both all players, NPCS, enemies, and the visual tiles they stand on
	*/
	public class Zone
	{
		private var visuLocation:Array;
		private var charLocation:Array;
		private var zoneTitle:String;

		private var i:Number;
		private var j:Number;
		
		/*
			Initialize the zone
		*/
		public function Zone(zoneTitle:String, visuLocation:Array, charLocation:Array)
		{
			this.visuLocation = visuLocation;
			this.charLocation = charLocation;
			this.zoneTitle = zoneTitle;
		}

		/*
			UNWRAP ZONE
		*/
		public function unwrap(zone:Zone):void
		{
			clear();
			this.visuLocation = zone.getVisuLocation();
			this.charLocation = zone.getCharLocation();
			this.zoneTitle = zone.getZoneTitle();


			//CREATE SETTER
		}

		/*
			Clear current zone information
		*/
		public function clear():void
		{
			//clear current tiles
			for(i = 0; i < Constants.NUMBER_OF_TILES_X; i++)
			{
				for(j = 0; j < Constants.NUMBER_OF_TILES_Y; j++)
				{
					CoreAccessor.getMain().removeChild(visuLocation[i][j]);
					CoreAccessor.getMain().removeChild(charLocation[i][j]);
				}
			}
		}

		/*
			Resets the zone to represent the current contents of the visuLocation:array and charLocation:Array
		*/
		public function load()
		{
			var tileWidth:Number = 900 / Constants.NUMBER_OF_TILES_X;
			var tileHeight:Number = 650 / Constants.NUMBER_OF_TILES_Y;
			var tile:MovieClip;


			

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
					CoreAccessor.getMain().addChild(tile);
				}
			}
		}




		/*
			visuLocation accessor
		*/
		public function getVisuLocation():Array
		{
			return visuLocation;
		}

		/*
			visuLocation accessor
		*/
		public function getCharLocation():Array
		{
			return charLocation;
		}

		/*
			visuLocation accessor
		*/
		public function getZoneTitle():String
		{
			return zoneTitle;
		}
	}
}