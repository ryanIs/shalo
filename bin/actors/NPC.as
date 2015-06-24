package bin.actors
{
	import bin.combat_statistics.*;

	/*
		Represents all Non-Player Characters
	*/
	public class NPC
	{

		private var battleStatistic:BattleStatistic;
		private var mover:NPCMover;

		public function NPC(classType:Number)
		{
			mover = new NPCMover(classType);
			battleStatistic = new BattleStatistic(classType);
		}

		/*
			Make hero appear at this position
		*/
		public function spawn(x:Number, y:Number, direction:Object = null):void
		{
			mover.spawn(x, y, direction);
		}
	}
}