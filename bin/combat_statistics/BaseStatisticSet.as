package bin.combat_statistics
{
	/*
		What does this do?
		Does it need getters and setters?
	*/

	public class BaseStatisticSet
	{
		private var stats:Dictionary =
		[
			"hp":CombatStatistic,
			"resource":CombatStatistic,
			"strength":CombatStatistic
		]

		public function BaseStatisticSet()
		{

		}

		public function getStats():Dictionary
		{
			return stats;
		}

		public function setStats(stats:Dictionary):void
		{
			this.stats = stats;
		}
	}
}