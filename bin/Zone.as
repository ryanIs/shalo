package bin
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
			setVisuLocation(visuLocation);
			setCharLocation(charLocation);
			setZoneTitle(zoneTitle);
		}

		/*
			Destroy old contents, set new contents, auto load them
		*/
		public function unwrap(zone:Zone, autoLoad:Boolean = true):void
		{
			clear();

			setVisuLocation(zone.getVisuLocation());
			setCharLocation(zone.getCharLocation());
			setZoneTitle(zone.getZoneTitle());

			if(autoLoad)
			{
				load();
			}
		}

		/*
			Clear current zone information
		*/
		public function clear():void
		{
			//clear current tiles
			var main:MovieClip = CoreAccessor.getMain();
			var char:MovieClip;
			for(i = 0; i < Constants.NUMBER_OF_TILES_X; i++)
			{
				for(j = 0; j < Constants.NUMBER_OF_TILES_Y; j++)
				{
					main.removeChild(visuLocation[j][i]);
					char = charLocation[i][j];
					if(char != null)
					{
						main.removeChild(char);
					}
				}
			}
		}

		/*
			Loads zone to represent the current contents of the visuLocation:array and charLocation:Array
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

		public function getVisuLocation():Array
		{
			return visuLocation;
		}

		public function getCharLocation():Array
		{
			return charLocation;
		}

		public function getZoneTitle():String
		{
			return zoneTitle;
		}

		public function setVisuLocation(visuLocation:Array):void
		{
			this.visuLocation = visuLocation;
		}

		public function setCharLocation(charLocation:Array):void
		{
			this.charLocation = charLocation;
		}

		public function setZoneTitle(zoneTitle:String):void
		{
			this.zoneTitle = zoneTitle;
		}
	}
}