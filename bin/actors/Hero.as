package bin.actors
{
	import bin.combat_statistics.*;
	import flash.display.MovieClip;

	/*
		Represents the user class that will be controlled
	*/
	public class Hero
	{
		private var battleStatistic:BattleStatistic;
		private var mover:HeroMover;

		public function Hero(classType:Number)
		{
			mover = new HeroMover(classType);
			battleStatistic = new BattleStatistic(classType);
		}

		/*
			Make hero appear at this position
		*/
		public function spawn(x:Number, y:Number):void
		{
			mover.spawn(x, y);
		}

		/*
			Move hero to this location
		*/
		public function setCoordinates(xSquare:Number, ySquare:Number):void
		{
			mover.setCoordinates(xSquare, ySquare);
		}

		public function getMover():HeroMover
		{
			return mover;
		}

		public function getMC():MovieClip
		{
			return mover.getMC();
		}

	}
}