package bin.combat_statistics
{
	import bin.Constants;
	/*
		Set up the default statistics value for each character
	*/
	public class CombatStatisticDefaultFactory
	{
		public static function get(classType:Number, statName:String):Number
		{
			var statValue:Number = 1;
			switch(classType)
			{
				case Constants.CLASS_FIGHTER:

				break;	
				default
					switch(statName)
					{
						case Constants.HP:
							statValue = 10;
						break;
						case Constants.MANA:
							statValue = 5;
						break;
						case Constants.STACKS:
							statValue = 5;
						break;
						case Constants.RAGE:
							statValue = 3;
						break;
						case Constants.PHYSICAL_DAMAGE:
							statValue = 2;
						break;
						case Constants.MAGICAL_DAMAGE:
							statValue = 2;
						break;
						case Constants.CRITICAL:
							statValue = 0.02;
						break;
						case Constants.DODGE:
							statValue = 0;
						break;
						case Constants.PHYSICAL_DEFENCE:
							statValue = 0;
						break;
						case Constants.MAGICAL_DEFENCE:
							statValue = 0;
						break;
						case Constants.ABT:
							statValue = 0;
						break;
						case Constants.MOVEMENT_SPEED:
							statValue = 1;
						break;
						case Constants.TEMPO:
							statValue = 1;
						break;
					}
			}

			return statValue;
		}
	}

}