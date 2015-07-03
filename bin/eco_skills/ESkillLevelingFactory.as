package bin.eco_skills
{
	/*
		Handles leveling up all eco skills based on its name
	*/
	public class ESkillLevelingFactory
	{
		public function ESkillLevelingFactory(){}

		public static function get(name:String):Function
		{
			var func:Function;
			switch(name)
			{
				default:
					func = function(maxExpDots:Number, level:Number):Object
					{
						var retObj = {};
						retObj["maxExpDots"] = maxExpDots + 1;
						retObj["level"] = level + 1;
						return retObj;
					};
			}
			return func;
		}
	}
}