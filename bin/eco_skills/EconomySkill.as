package bin.eco_skills
{

	/*
		Type ambigious economy skill representation
	*/
	public class EconomySkill
	{
		private var name:String = new String();
		private var expDots:Number = 0;
		private var maxExpDots:Number = 3;
		private var level:Number = 1;
		private var levelUpFunc:Function;

		public function EconomySkill(name:String)
		{
			this.name = name;
			levelUpFunc = ESkillLevelingFactory.get(name);
		}

		public function setDefaults(name:String, expDots:Number, maxExpDots:Number, level:Number):void
		{
			this.name = name;
			this.expDots = expDots;
			this.maxExpDots = maxExpDots;
			this.level = level;
			levelUpFunc = ESkillLevelingFactory.get(name);
		}

		/*
			Increase exp, returns true if leveld up
		*/
		public function gainExp(expGain:Number):Boolean
		{
			expDots += expGain;
			if(expDots >= maxExpDots)
			{
				//if we are leveling more than once
				if(expDots / maxExpDots > 1)
				{
					var numberOfLevelUps:Number = Math.floor(expDots / maxExpDots);
					for(var i:Number = 0; i < numberOfLevelUps; i++)
					{
						expDots -= maxExpDots;
						levelUp();
					}
				}
				expDots -= maxExpDots;
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
			var results:Object = levelUpFunc(maxExpDots, level);
			maxExpDots = results["maxExpDots"];
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
			return expDots;
		}
		
		public function setExp(expDots:Number):void
		{
			this.expDots = expDots;
		}

		public function getMaxExp():Number
		{
			return maxExpDots;
		}
		
		public function setMaxExp(maxExpDots:Number):void
		{
			this.maxExpDots = maxExpDots;
		}

	}
}