package bin.actors
{
	import bin.*;
	import flash.display.MovieClip;
	import flash.utils.*;

	/*
		Represents all game tiles and their physical attributes
	*/
	public class Tile extends MovieClip
	{
		private var collidable:Boolean = true;

		public function Tile()
		{
			determineAttributes();
		}

		/*
			Determine the attributes of this class based on its type
		*/
		private function determineAttributes():void
		{
			//is NOT collidable
			var index:Number;
			var _class:Class = Class(getDefinitionByName(getQualifiedClassName(this)));

			index = Constants.NON_COLLIDABLE_TILES.indexOf(_class);
			if(index > 0)
			{
				if(this is Constants.NON_COLLIDABLE_TILES[index])
				{
					collidable = false;
				}
			}
		}

		public function setCollidable(collidable:Boolean):void
		{
			this.collidable = collidable;
		}

		public function getCollidable():Boolean
		{
			return collidable;
		}

	}
}