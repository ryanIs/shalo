package bin.combat_statistics
{
	/*
		Container class for all combat related info
	*/
	public class BattleStatistic
	{
		private var classType:Number;

		private var baseStatistic:BaseStatisticSet;
		private var additiveStatistic:AdditiveStatistic;
		private var enhancedStatistic:BaseStatisticSet;

		private var passiveAbilities:Array;//equiped passive abilities
		private var activeAbilities:Array;//equiped activeAbilities

		private var learnedPassiveAbilities:Array//all passive abilities
		private var learnedActiveAbilities:Array//all active abilities

		private var equipment:Array;//equipment

		public function BattleStatistic(classType:Number)
		{
			this.classType = classType;

			setStatistics(classType);
		}

		public function setStatistics(classType:Number)
		{
			baseStatistic = new BaseStatisticSet(classType, true);
			enhancedStatistic = new BaseStatisticSet(classType, false);
		}


	}
}