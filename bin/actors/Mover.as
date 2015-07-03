package bin.actors
{
	import flash.display.MovieClip;
	import flash.events.*;
	import bin.*;

	/*
		Represents any thing that can move and is displayed on screen (hero, enemies, npcs)
	*/
	public class Mover
	{
		protected var locX:Number, locY:Number, locNew:Array = [0, 0];
		protected var inMove:Boolean = false, moveDirection = 0;;
		protected var mc:MovieClip;
		protected var hitBox:MovieClip;

		protected var frozen:Boolean = false;

		public var talkCommand:Number = -1;
		public var talkingWith:Humanoid;
		protected var MOVEMENT_TIME_ONE_BLOCK:Number = 10; // FPS = 30
		protected var tileWidth:Number = Math.floor(CoreAccessor.getMain().stage.stageWidth / Constants.NUMBER_OF_TILES_X);
		protected var tileHeight:Number = (CoreAccessor.getMain().stage.stageHeight / Constants.NUMBER_OF_TILES_Y);
		protected var movementSpeedOneBlockX:Number =  tileWidth / MOVEMENT_TIME_ONE_BLOCK;
		protected var movementSpeedOneBlockY:Number = tileHeight / MOVEMENT_TIME_ONE_BLOCK;
		private var movementTimer:Number = 0;

		public function Mover(classType:Number)
		{
			determineModel(classType);
			mc.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		public function setTalkCommand(_cmd:Number):void {
			//talkCommand = InteractionFactory.getInteraction(_cmd);
			talkCommand = _cmd;
			return;
		}
		public function setTalkingWith(_hum:Humanoid):void {
			talkingWith = _hum;
			return;
		}
		private function enterFrameHandler(e:Event)
		{
			if(inMove) 
			{
				
				if(moveDirection == 0)
				{
					mc.y -= movementSpeedOneBlockY;
				}
				else if(moveDirection == 1)
				{
					mc.x += movementSpeedOneBlockX;
				}
				else if(moveDirection == 2)
				{
					mc.y += movementSpeedOneBlockY;
				}
				else if(moveDirection == 3)
				{
					mc.x -= movementSpeedOneBlockX;
				}
				if(movementTimer++ >= MOVEMENT_TIME_ONE_BLOCK) 
				{
					setCoordinates(locNew[0], locNew[1]);
					inMove = false;
					movementTimer = 0;
					return;
				}
			}
		}

		/*
			Initiate character movement
		*/
		protected function initMove(_direction:Number):void 
		{
			var tempX:Number;
			var tempY:Number;
			if(_direction == 0)
			{
				tempY = locY - 1;
				tempX = locX;	
			} 
			else if(_direction == 1)
			{ 
				tempX = locX + 1; 
				tempY = locY;
			}
			else if(_direction == 2)
			{ 
				tempY = locY + 1; 
				tempX = locX;
			}
			else if(_direction == 3)
			{ 
				tempX = locX - 1; 
				tempY = locY;
			}

			var campaignDriver:CampaignDriver = CoreAccessor.getDriver() as CampaignDriver;

			if(!inMove) 
			{
				if(campaignDriver.getZone().moveHero(
						campaignDriver.getHero(),
						tempX, 
						tempY
					))
				{
					locNew = [locX, locY];
					moveDirection = _direction;
					inMove = true;
					mc.rotation = 90 * _direction;
					inMove = true;
					if(_direction == 0) locNew[1] = locY - 1;
					else if(_direction == 1) locNew[0] = locX + 1;
					else if(_direction == 2) locNew[1] = locY + 1;
					else if(_direction == 3) locNew[0] = locX - 1;
				}
			}
			return;
		}

		/*
			Loads the visual for the mover based on the model number (check Constants.as)
		*/
		private function determineModel(modelNumber:Number):void
		{
				mc = new Humanoid();
			switch(modelNumber)
			{
				case Constants.CLASS_FIGHTER:
					//mc = new FighterClassVisual();
					 mc.initHumanoid("hero", this);
				break;
				case Constants.CLASS_COMMONER:
					//mc = new CommonerClassVisual();
					 mc.initHumanoid("commoner", this);
				break;
				case Constants.CLASS_SHOPKEEPER:
					//mc = new CommonerClassVisual();
					 mc.initHumanoid("shopKeeper", this);
				break;
				default:
				break;
			}
		} 

		/*
			Other Mover variables
		*/
		protected function setDisplayArgs(args:Object):void
		{
			if(args != null)
			{
				if(args["direction"])
				{
					mc.rotation = 90 * args["direction"];
				}
			}
		}

		/*
			Add to stage
		*/
		public function spawn(x:Number, y:Number, args:Object = null):void
		{
			setCoordinates(x, y);
			setDisplayArgs(args);
			appear();
		}

		/*
			Appear
		*/
		public function appear():void
		{
			CoreAccessor.getMain().addChild(mc);
		}

		/*
			Move visual to this position
		*/
		public function setCoordinates(x:Number, y:Number):void
		{
			locX = x;
			locY = y;
			mc.x = (locX * tileWidth) + (tileWidth/2);
			mc.y = (locY * tileHeight) + (tileHeight/2);
		}

		/*
			If we cannot move
		*/
		public function getFrozen():Boolean
		{
			return frozen;
		}

		/*
			Set frozen state
		*/
		public function setFrozen(frozen:Boolean):void
		{
			this.frozen = frozen;
		}


		public function getLocY():Number
		{
			return locY;
		}
		
		public function setLocY(locY:Number):void
		{
			this.locY = locY;
		}

		public function getLocX():Number
		{
			return locX;
		}
		
		public function setLocX(locX:Number):void
		{
			this.locX = locX;
		}

		


	}
}