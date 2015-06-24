package bin.actors
{
	import bin.*;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
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
			handles sending messages to mover class when direction is pressed
		*/
		private function heroEnterFrameHandler(e:Event):void
		{
			if(activeDirection["up"] == true)
			{
				initMove(0);
			}
			else if(activeDirection["down"] == true)
			{
				initMove(2);
			}
			else if(activeDirection["left"] == true)
			{
				initMove(3);
			}
			else if(activeDirection["right"] == true)
			{
				initMove(1);
			}
		}

		/*
			set up user controls
		*/
		public function initiateFreeRoamControls():void
		{
			CoreAccessor.getMain().stage.addEventListener(KeyboardEvent.KEY_DOWN, keyPressDownEvent);
			CoreAccessor.getMain().stage.addEventListener(KeyboardEvent.KEY_UP, keyPressUpEvent);
		}

		/*
			stop user controls
		*/
		public function haltFreeRoamControls():void
		{
			CoreAccessor.getMain().stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressDownEvent);
			CoreAccessor.getMain().stage.removeEventListener(KeyboardEvent.KEY_UP, keyPressUpEvent);
		}

		/*
			key pressed up event
		*/
		private function keyPressUpEvent(e:KeyboardEvent)
		{
			const keyPressed:Number = e.keyCode;

			if(keyPressed == controls["up"])
			{
				mc.removeEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
				activeDirection["up"] = false;
			}
			else if(keyPressed == controls["down"])
			{
				mc.removeEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
				activeDirection["down"] = false;
			}
			else if(keyPressed == controls["left"])
			{
				mc.removeEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
				activeDirection["left"] = false;
			}
			else if(keyPressed == controls["right"])
			{
				mc.removeEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
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
					mc.addEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
					activeDirection["up"] = true;
				}
				else if(keyPressed == controls["down"])
				{
					mc.addEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
					activeDirection["down"] = true;
				}
				else if(keyPressed == controls["left"])
				{
					mc.addEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
					activeDirection["left"] = true;
				}
				else if(keyPressed == controls["right"])
				{
					mc.addEventListener(Event.ENTER_FRAME, heroEnterFrameHandler);
					activeDirection["right"] = true;
				}
			}
		}
	}
}