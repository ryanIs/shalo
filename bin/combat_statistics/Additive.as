package bin.combat_statistics
{
	/*
		Changes to combat-based statistics due to buffs, debuffs,
		equipment, and passives.


	*/
	public class Additive
	{

		private var name:String;

		public function Additive()
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
	}
}