package bin.actors
{
	import bin.*;
	import flash.events.KeyboardEvent;
	import flash.utils.setTimeout;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;

	/*
		Represents a Non-player character
	*/
	public class NPCMover extends Mover
	{
		private var doesMove:Boolean = false;
		private var moveTimer:uint = 0;

		public function NPCMover(classType:Number, args:Object = null)
		{
			super(classType);
			handleArgs(args);
			setDisplayArgs(args);
		}	

		/*
			Handle extra arguments
		*/
		private function handleArgs(args:Object):void
		{
			if( args != null)
			{
				if(args["doesMove"] != null)
				{
					moveTimer = args["doesMove"] == true ? setInterval(handleRandomMovement, Constants.NPC_MOVEMENT_MEDIUM) : 0;
				}
			}
		}

		/*
			Initiate character movement by checking direction and seeing if the zone will allow our suggested movement
		*/
		override protected function initMove(_direction:Number):void 
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

			var campaignDriver:CampaignDriver =  (CoreAccessor.getDriver() as CampaignDriver);

			if(!inMove) 
			{
				if(campaignDriver.getZone().moveNPC(
						tempX, 
						tempY,
						locX,
						locY
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
			Handle NPC movement
		*/
		private function handleRandomMovement():void
		{
			var _direction:Number = Math.floor(Math.random() * 4);
			initMove(_direction);
		}

		/*
			Used to deconstruct this object
		*/
		public function deconstruct():void
		{
			clearInterval(moveTimer);
		}
	}
}