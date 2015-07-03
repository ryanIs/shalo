package bin
{
	import flash.display.*;
	import bin.actors.*;
	
	/*
		Represents both all players, NPCS, enemies, and the visual tiles they stand on
	*/
	public class Zone
	{
		private var visuLocation:Array;
		private var charLocation:Array;
		private var zoneTitle:String;
		
		/*
			[[xSquare, ySquare, nextZoneIdentificationNumber, DirectionTraveling], [...] , [...]];
		*/
		private var endPoints:Array;

		private var i:Number;
		private var j:Number;

		private var maxDepth:Number = 0;
		
		/*
			Initialize the zone
		*/
		public function Zone(zoneTitle:String, visuLocation:Array, charLocation:Array, endPoints:Array)
		{
			setVisuLocation(visuLocation);
			setCharLocation(charLocation);
			setZoneTitle(zoneTitle);
			setEndPoints(endPoints);
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
			setEndPoints(zone.getEndPoints());

			if(autoLoad)
			{
				load();
			}
		}

		/*
			An npc has requested a move
		*/
		public function moveNPC(xSquare:Number, ySquare:Number, oldXSquare:Number, oldYSquare:Number):Boolean
		{
			var npc:NPC = charLocation[oldXSquare][oldYSquare];

			if(isOutOfBoundsTile(xSquare, ySquare) && collidableTile(xSquare, ySquare))
			{
				charLocation[ySquare][xSquare] = npc;
				charLocation[oldYSquare][oldXSquare] = null;
				return true;
			}


			return false;
		}


		/*
			The hero requests a move, if it can move it return true, otherwise return false
			if the player hits a 'next zone tile' we proceed to the next zone
		*/
		public function moveHero(hero:Hero, xSquare:Number, ySquare:Number):Boolean
		{
			var oldX:Number = hero.getMover().getLocX();
			var oldY:Number = hero.getMover().getLocY();
			if(endPointTile(xSquare, ySquare))
			{
				return false;
			}
			else if(collidableTile(xSquare, ySquare))
			{
				charLocation[ySquare][xSquare] = hero;
				charLocation[oldY][oldX] = null;
				return true;
			}

			return false;
		}

		/*
			CHecks to see if the tile is out of bounds AKA greater/lesser then width/height 
			returns true if outofbounds false otherwise
		*/
		public function isOutOfBoundsTile(xSquare:Number, ySquare:Number):Boolean
		{
			if(xSquare < 0 || xSquare > charLocation[0].length || 
				ySquare < 0 || ySquare > charLocation.length)
			{
				return false;
			}

			return true;
		}

		/*
			Checks to see if hero wants to move to a point that will transition him to a new zone
		*/
		public function endPointTile(xSquare:Number, ySquare:Number):Boolean
		{
			for(var i:Number = 0; i < endPoints.length; i++)
			{
				if(xSquare == endPoints[i][0] && ySquare == endPoints[i][1])
				{
					(CoreAccessor.getDriver() as CampaignDriver).zoneTransition(endPoints[i][2], endPoints[i][3]);
					return true;
				}
			}

			return false;
		}

		/*
			Determines if this tile is collidable
		*/
		public function collidableTile(xSquare:Number, ySquare:Number):Boolean
		{
			var tile:Tile = visuLocation[ySquare][xSquare];
			return tile.getCollidable();
		}

		/*
			Add our hero to the zone, ASSUMING THE SLOT THE HERO IS ON IS FREE
		*/
		public function addHero(hero:Hero, xSquare:Number, ySquare:Number):void
		{
			charLocation[xSquare][ySquare] = hero;

			hero.spawn(xSquare, ySquare);
			CoreAccessor.getMain().setChildIndex(hero.getMC(), CoreAccessor.getMain().numChildren-1);
		}

		/*
			Move hero to here
		*/
		public function moveHeroTo(hero:Hero, xSquare:Number, ySquare:Number):void
		{
			charLocation[ySquare][xSquare] = hero;
			hero.setCoordinates(xSquare, ySquare);
			CoreAccessor.getMain().setChildIndex(hero.getMC(), CoreAccessor.getMain().numChildren-1);
		}

		/*
			Clear current zone information
		*/
		public function clear():void
		{
			//clear current tiles
			var main:MovieClip = CoreAccessor.getMain();
			for(var y:Number = 0; y < Constants.NUMBER_OF_TILES_Y; y++)
			{
				for(var _x:Number = 0; _x < Constants.NUMBER_OF_TILES_X; _x++)
				{
					//remove visual
					main.removeChild(visuLocation[y][_x]);

					//remove characters
					if(charLocation[y][_x] != null)
					{
						if(charLocation[y][_x] is NPC)
						{
							charLocation[y][_x].deconstruct();
							main.removeChild(charLocation[y][_x].getMover().getMC());
						}
						else if(charLocation[y][_x] is Hero)
						{
							//do nothing?
						}
					}
				}
			}
		}

		/*
			Loads zone to represent the current contents of the visuLocation:array and charLocation:Array
		*/
		public function load()
		{
			var tileWidth:Number = CoreAccessor.getMain().stage.stageWidth / Constants.NUMBER_OF_TILES_X;
			var tileHeight:Number = CoreAccessor.getMain().stage.stageHeight / Constants.NUMBER_OF_TILES_Y;
			var tile:Tile;
			var character:NPC;

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
		

			/*
				Place each character on its designated tile
			*/
			for(var i:Number = 0; i < charLocation.length; i++)
			{
				for(var j:Number = 0; j < charLocation[i].length; j++)
				{
					if(charLocation[i][j] != null)
					{
						if(charLocation[i][j] is NPC)
						{
							var npc:NPC = charLocation[i][j];
							npc.spawn(j, i);
							CoreAccessor.getMain().setChildIndex(npc.getMC(), CoreAccessor.getMain().numChildren-1);
						}
					}
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

		public function getEndPoints():Array
		{
			return endPoints;
		}
		
		public function setEndPoints(endPoints:Array):void
		{
			this.endPoints = endPoints;
		}

	}
}
