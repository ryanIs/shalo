package bin.actors
{
	import bin.*;
	import flash.events.KeyboardEvent;
	import flash.utils.setTimeout;


	/*
		The class that will control HERO MOVEMENT ONLY
	*/
	public class HeroMover extends Mover
	{

		//for key hold checker
		private var moveDown:uint;

		//hot keys for controls
		private var controls:Object = {
			"up" : 87,
			"down" : 83,
			"left" : 65,
			"right" : 68
		};

		//the direction we are currently travelling
		private var activeDirection:Object = {
			"up" : false,
			"down" : false,
			"left" : false,
			"right" : false
		};

		public function HeroMover(classType:Number)
		{
			super(classType);
			initiateFreeRoamControls();
		}

		/*
			set up user controls
		*/
		public function initiateFreeRoamControls():void
		{
			CoreAccessor.getMain().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressDownEvent);
			CoreAccessor.getMain().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressUpEvent);
		}

		/*
			stop user controls
		*/
		public function haltFreeRoamControls():void
		{
			CoreAccessor.getMain().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressDownEvent);
			CoreAccessor.getMain().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressUpEvent);
		}

		/*
			key pressed up event
		*/
		private function keyPressUpEvent(e:KeyboardEvent)
		{
			const keyPressed:Number = e.keyCode;

			if(keyPressed == controls["up"])
			{
				activeDirection["up"] = false;
			}
			else if(keyPressed == controls["down"])
			{
				activeDirection["down"] = false;
			}
			else if(keyPressed == controls["left"])
			{
				activeDirection["left"] = false;
			}
			else if(keyPressed == controls["right"])
			{
				activeDirection["right"] = false;
			}

		}

		/*
			key pressed event
		*/
		private function keyPressDownEvent(e:KeyboardEvent)
		{
			if(!getFrozen())//should remove this check
			{
				const keyPressed:Number = e.keyCode;

				if(keyPressed == controls["up"])
				{
					initMove(0);
					activeDirection["up"] = true;

				}
				else if(keyPressed == controls["down"])
				{
					initMove(2);
					activeDirection["down"] = true;
				}
				else if(keyPressed == controls["left"])
				{
					initMove(3);
					activeDirection["left"] = true;
				}
				else if(keyPressed == controls["right"])
				{
					initMove(1);
					activeDirection["right"] = true;
				}
			}
		}
	}
}