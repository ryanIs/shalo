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
		private var gainPerLevel:Function // required exp thing

		public function CombatStatistic()
		{

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

		public function getMaxExp():Number;
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
			this.staValue = statValue;
		}

		public function getGainPerLevel():Function
		{
			return gainPerLevel;
		}
		public function setGainPerLevel(gainPerLevel:Function):void
		{
			this.gainPerLevel = gainPerLevel;
		}
	}
}