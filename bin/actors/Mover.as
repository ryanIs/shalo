package bin.actors
{
	import flash.display.MovieClip;
	import bin.*;

	/*
		Represents any thing that can move and is displayed on screen (hero, enemies, npcs)
	*/
	public class Mover
	{
		protected var mc:MovieClip;
		protected var hitBox:MovieClip;

		protected var frozen:Boolean = false;

		protected var movementSpeed:Number = 4;

		public function Mover(classType:Number)
		{
			determineModel(classType);
		}

		/*
			Loads the visual for the mover based on the model number (check Constants.as)
		*/
		private function determineModel(modelNumber:Number):void
		{
			switch(modelNumber)
			{
				case Constants.CLASS_FIGHTER:
					mc = new FighterClassVisual();
				break;
			}
		} 

		/*
			Add to stage
		*/
		public function spawn(x:Number, y:Number):void
		{
			CoreAccessor.getMain().addChild(mc);
			setCoordinates(x, y);
		}

		/*
			Move visual to this position
		*/
		public function setCoordinates(x:Number, y:Number):void
		{
			mc.x = x;
			mc.y = y;
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

	}
}