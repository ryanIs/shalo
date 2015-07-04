package bin.combat_statistics
{
	import bin.Constants;
	/*
		The starting statistics and resource set for each parent class and subclass
	*/
	public class BaseStatisticFactory
	{
		public static function get(classType:Number, initiate:Boolean):Object
		{
			var stats:Object = {};

			stats[Constants.HP] = 				new CombatStatistic(Constants.HP);
			stats[Constants.RESOURCE] = 			new CombatStatistic(Constants.RESOURCE);
			
			stats[Constants.PHYSICAL_DAMAGE] =  	new CombatStatistic(Constants.PHYSICAL_DAMAGE);
			stats[Constants.MAGICAL_DAMAGE] =  	new CombatStatistic(Constants.MAGICAL_DAMAGE);
			stats[Constants.CRITICAL] = 			new CombatStatistic(Constants.CRITICAL);
			
			stats[Constants.DODGE] = 				new CombatStatistic(Constants.DODGE);
			stats[Constants.MAGICAL_DEFENCE] =  	new CombatStatistic(Constants.MAGICAL_DEFENCE);
			stats[Constants.PHYSICAL_DEFENCE] =  	new CombatStatistic(Constants.PHYSICAL_DEFENCE);
			
			stats[Constants.MOVEMENT_SPEED] =  	new CombatStatistic(Constants.MOVEMENT_SPEED);
			stats[Constants.ABT] = 				new CombatStatistic(Constants.ABT);
			stats[Constants.TEMPO] = 				new CombatStatistic(Constants.TEMPO);

			/*
				Determine extra statistics based on class (most likely RESOURCE)
			*/
			switch(classType)
			{
				case Constants.CLASS_FIGHTER:
					stats[Constants.RESOURCE] = new CombatStatistic(Constants.MANA);
				break;

				default:
					stats[Constants.RESOURCE] = new CombatStatistic(Constants.MANA);
			}

			if(initiate)
			{
				//give all statistics default values
				for(var key:String in stats) {
					var cs:CombatStatistic = stats[key];
					cs.initDefaults();
				}
			}

			return stats;
		}
	}
}