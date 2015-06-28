package bin.combat_statistics
{
	/*
		AbilityBase is a base class for ALL abilities.
		Such as passive, active, buffs, etc.
	*/
	public class AbilityBase
	{

		private var name:String;

		public function AbilityBase()
		{

		}

		public function getName():String
		{
			return name;
		}

		public function setName(name:String):String
		{
			this.name = name;
		}
	}
}