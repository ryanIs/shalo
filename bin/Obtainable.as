package bin
{
	/*
		Represnts an item that can be obtained through crafts and skills (fihs, wood, etc)
	*/
	public class Obtainable extends Item
	{

		protected var difficulty:Number;
		protected var expGiven:Number;
		protected var maxLevelForExp:Number = 9999;

		public function setMaxLevelForExp(maxLevelForExp:Number):void
		{
			this.maxLevelForExp = maxLevelForExp;
		}

		public function getExpGiven(skillLevel:Number):Number
		{
			if(skillLevel <= maxLevelForExp)
			{
				return expGiven;
			}
			return 0;
		}
		
		public function setExpGiven(expGiven:Number):void
		{
			this.expGiven = expGiven;
		}

		public function getDifficulty():Number
		{
			return difficulty;
		}
		
		public function setDifficulty(difficulty:Number):void
		{
			this.difficulty = difficulty;
		}
		
	}
}