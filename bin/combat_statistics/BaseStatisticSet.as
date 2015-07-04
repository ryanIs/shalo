package bin.combat_statistics
{

	/*
		Represents a set of base class statistics
	*/
	public class BaseStatisticSet
	{
		private var stats:Object;

		public function BaseStatisticSet(classType:Number, initDefaults:Boolean)
		{
			stats = BaseStatisticFactory.get(classType, initDefaults);
		}

		public function getStats():Object
		{
			return stats;
		}

		public function setStats(stats:Object):void
		{
			this.stats = stats;
		}

		/*
			get a stat if it exists
		*/
		public function getComStat(str:String):CombatStatistic
		{
			var cStat:CombatStatistic = null;
			if(stats[str] != undefined)
			{
				cStat = stats[str];
			}
			return cStat;
		}
	}
}