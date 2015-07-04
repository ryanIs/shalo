package bin.combat_statistics
{
	/*
		Represents any combat-based stat.
	*/
	public class CombatStatistic
	{
		private var name:String;
		private var exp:Number;
		private var maxExp:Number;
		private var level:Number;
		private var statValue:Number;
		private var levelUpFunc:Function // required exp thing

		public function CombatStatistic(name:String, defaults:Object = null)
		{
			this.name = name;
			
			levelUpFunc = CombatStatisticLevelGainFactory.get(name);

			if(defaults != null)
			{
				if(defaults["statValue"] != undefined)
				{
					statValue = defaults["statValue"];
				}
			}
		}

		public function initDefaults():void
		{
			
		}

		/*
			Increase exp, returns true if leveld up
		*/
		public function gainExp(expGain:Number):Boolean
		{
			exp += expGain;
			if(exp >= maxExp)
			{
				//if we are leveling more than once
				if(exp / maxExp > 1)
				{
					var numberOfLevelUps:Number = Math.floor(exp / maxExp);
					for(var i:Number = 0; i < numberOfLevelUps; i++)
					{
						exp -= maxExp;
						levelUp();
					}
				}
				exp -= maxExp;
				levelUp();
				return true;
			}

			return false;
		}

		public function levelUp():void
		{
			var results:Object = levelUpFunc(maxExp, level, statValue);
			maxExp = results["maxExp"];
			level = results["level"];
			statValue = results["statValue"];
		}

		public function getName():String
		{
			return name;
		}
		public function setName(name:String):void
		{
			this.name = name;
		}

		public function getExp():Number
		{
			return exp;
		}
		public function setExp(exp:Number):void
		{
			this.exp = exp;
		}

		public function getMaxExp():Number
		{
			return maxExp;
		}
		public function setMaxExp(maxExp:Number):void
		{
			this.maxExp = maxExp;
		}

		public function getLevel():Number
		{
			return level;
		}
		public function setLevel(level:Number):void
		{
			this.level = level;
		}

		public function getStatValue():Number
		{
			return statValue;
		}
		public function setStatValue(statValue:Number):void
		{
			this.statValue = statValue;
		}

		
	}
}