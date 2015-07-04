package bin.combat_statistics
{
	/*
		Calculates gain per level given the statistic
	*/
	public class CombatStatisticLevelGainFactory
	{
		public static function get(name:String):Function
		{
			var func:Function

			switch(name)
			{
				//the default for all statistics (THIS SHOULD BE CHANGED)
				default:
					func = function(maxExpDots:Number, level:Number, statValue:Number):Object
					{
						var retObj = {};
						retObj["maxExpDots"] = maxExpDots + 1;
						retObj["level"] = level + 1;
						statValue["statValue"] = statValue + 1;
						return retObj;
					};
			}

			return func;
		}
	}

}

