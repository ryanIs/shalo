package bin.eco_skills
{

	/*
		Economy Statistics container
	*/
	public class EconomyStatistic
	{
		//name : EconomySkill representation
		private var economySkills:Object = {
			"mining" : new EconomySkill("mining"),
			"orb making" : new EconomySkill("orb making"),
			"book making" : new EconomySkill("book making"),
			"fishing" : new EconomySkill("fishing"),
			"cooking" : new EconomySkill("cooking"),
			"smithing" : new EconomySkill("smithing"),
			"crafting" : new EconomySkill("crafting"),
			"woodcutting" : new EconomySkill("woodcutting"),
			"woodworking" : new EconomySkill("woodworking")
		};

		public function EconomyStatistic(){}

		/*
			Obtain an eco skill to tamper with
		*/
		public function getSkill(name:String):EconomySkill
		{
			return economySkills[name.toLowerCase()];
		}

	}
}