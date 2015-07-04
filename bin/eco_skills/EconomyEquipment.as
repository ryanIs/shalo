package bin.eco_skills
{
	import bin.*;
	/*
		Represnts an item that can be obtained through crafts and skills (fihs, wood, etc)
	*/
	public class EconomyEquipment extends Item
	{

		protected var potency:Number;

		public function getPotency():Number
		{
			return potency;
		}
		
		public function setPotency(potency:Number):void
		{
			this.potency = potency;
		}
		
	}
}