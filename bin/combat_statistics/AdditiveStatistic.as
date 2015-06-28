package bin.combat_statistics
{
	/*
		Represents combat stat modifiers:
		buffs, debuffs, equipment, passives.
		Note that removing an additive requires the name of the additive
		to be removed as the parameter.
	*/
	public class AdditiveStatistic
	{

		private var temporaryBuffAdditive:Array = new Array();
		private var temporaryDebuffAdditive:Array = new Array();
		private var equipmentAdditive:Array = new Array();
		private var passiveAdditive:Array = new Array();

		public function AdditiveStatistic() // Constructor
		{

		}

		public function addToTemporaryBuffAdditive(buff:Additive):void
		{
			temporaryBuffAdditive.push(buff); // Add element to array
		}

		/*
			Removes a buff based on the name of the buff.
		*/
		public function removeFromTemporaryBuffAdditive(name:String):Additive
		{
			/*
				for every element in the buff array, if array at
				index name equals array at endex of i, then
				swap that index with the index of array.length and
				use pop()

			*/
			for (var i:Number = 0; i < temporaryBuffAdditive.length; i++)
			{
				if (temporaryBuffAdditive[i].getName() == name)
				{
					var tempAdditive:Additive = temporaryBuffAdditive[i];
					temporaryBuffAdditive[i] = temporaryBuffAdditive[temporaryBuffAdditive.length - 1];
					temporaryBuffAdditive[temporaryBuffAdditive.length - 1] = tempAdditive;
				}
			}
			return temporaryBuffAdditive.pop();
		}

		public function addToTemporaryDebuffAdditive(debuff:Additive):void
		{
			temporaryDebuffAdditive.push(debuff); // Add element to array
		}

		/*
			Removes a debuff based on the name of the debuff.
		*/
		public function removeFromTemporaryDebuffAdditive(name:String):Additive
		{
			for (var i:Number = 0; i < temporaryDebuffAdditive.length; i++)
			{
				if (temporaryDebuffAdditive[i].getName() == name)
				{
					var tempAdditive:Additive = temporaryDebuffAdditive[i];
					temporaryDebuffAdditive[i] = temporaryDebuffAdditive[temporaryDebuffAdditive.length - 1];
					temporaryDebuffAdditive[temporaryDebuffAdditive.length - 1] = tempAdditive;
				}
			}
			return temporaryDebuffAdditive.pop();
		}
		
		public function addToEquipmentAdditive(equpiment:Additive):void
		{
			equipmentAdditive.push(equipment); // Add equipment element to array
		}

		public function removeFromEquipmentAdditive(name:String):Additive
		{
			for (var i:Number = 0; i < equipmentAdditive.length; i++)
			{
				if (equipmentAdditive[i].getName() == name)
				{
					var tempAdditive:Additive = equipmentAdditive[i];
					equipmentAdditive[i] = equipmentAdditive[equipmentAdditive.length - 1];
					equipmentAdditive[equipmentAdditive.length - 1] = tempAdditive;
				}
			}
			return equipmentAdditive.pop();
		}

		public function addToPassiveAdditive(passive:Additive):void
		{
			passiveAdditive.push(passive);
		}

		public function removeFromPassiveAdditive(name:String):Additive
		{
			for (var i:Number = 0; i < passiveAdditive.length; i++)
			{
				if (passiveAdditive[i].getName() == name)
				{
					var tempAdditive:Additive = passiveAdditive[i];
					passiveAdditive[i] = passiveAdditive[passiveAdditive.length - 1];
					passiveAdditive[passiveAdditive.length - 1] = tempAdditive;
				}
			}
		}
	}
}