package bin.eco_skills
{
	/*
		Type ambigious economy skill representation
	*/
	public class EconomySkill
	{
		private var name:String = new String();
		private var exp:Number = 0;
		private var maxExp:Number = 3;
		private var level:Number = 1;
		private var levelUpFunc:Function;

		public function EconomySkill(name:String)
		{
			this.name = name;
			levelUpFunc = ESkillLevelingFactory.get(name);
		}

		public function setDefaults(name:String, exp:Number, maxExp:Number, level:Number):void
		{
			this.name = name;
			this.exp = exp;
			this.maxExp = maxExp;
			this.level = level;
			levelUpFunc = ESkillLevelingFactory.get(name);
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

		/*
			Handles leveling up
		*/
		public function levelUp():void
		{
			var results:Object = levelUpFunc(maxExp, level);
			maxExp = results["maxExp"];
			level = results["level"];
		}

		public function getLevel():Number
		{
			return level;
		}

		public function getName():String
		{
			return name;
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

		public function toString():String
		{
			return "(level : " + level + ")\n" + "(exp: " + exp + ")\n" + "(maxExp : " + maxExp + ")";
		}

	}
}