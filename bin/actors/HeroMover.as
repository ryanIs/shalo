package bin.actors
{
	import bin.*;
	import flash.events.KeyboardEvent;


	/*
		The class that will control HERO MOVEMENT ONLY
	*/
	public class HeroMover extends Mover
	{

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
		}

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
			CoreAccessor.getMain().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressEvent);
		}

		/*
			stop user controls
		*/
		public function haltFreeRoamControls():void
		{
			CoreAccessor.getMain().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressEvent);
		}

		/*
			key pressed event
		*/
		private function keyPressEvent(e:KeyboardEvent)
		{
			if(!getFrozen())//should remove this check
			{
				const keyPressed:Number = e.keyCode;

				if(keyPressed == controls["up"])
				{
					mc.y -= movementSpeed;
				}
				else if(keyPressed == controls["down"])
				{
					mc.y += movementSpeed;
				}
				else if(keyPressed == controls["left"])
				{
					mc.x -= movementSpeed;
				}
				else if(keyPressed == controls["right"])
				{
					mc.x += movementSpeed;
				}
			}
		}
	}
}