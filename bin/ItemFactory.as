package bin
{
	import bin.eco_skills.*;
	public class ItemFactory
	{
		private static const FPS:Number = 30.00;
		private var itemID:Number;
		private var itemStackable:Boolean = true;
		public function ItemFactory() {}
		public static function getItemData(_itemID:Number):Item
		{
			var _returnItem:Item = new Item();
			_returnItem.setItemID(_itemID);
			_returnItem.setItemStackable(false);
			switch(_itemID)
			{
				case 0:
					_returnItem.setItemTag("healthPotion");
					_returnItem.setShopRefillTime(3);
				break;
				case 1:
					_returnItem.setItemTag("tinOre");
					_returnItem.setShopRefillTime(3);
				break;
				case 2:
					_returnItem.setItemTag("copperOre");
					_returnItem.setShopRefillTime(3);
				break;
				case 3:
					_returnItem.setItemTag("ironOre");
					_returnItem.setShopRefillTime(3);
				break;
				case 4:
					_returnItem.setItemTag("steelOre");
					_returnItem.setShopRefillTime(FPS * 30);
				break;
				case 5:
					_returnItem.setItemTag("berylliumOre");
					_returnItem.setShopRefillTime(FPS * 30);
				break;
				case 6:
					_returnItem.setItemTag("strontiumOre");
					_returnItem.setShopRefillTime(FPS * 30);
				break;
				case 7:
					_returnItem.setItemTag("franciumOre");
					_returnItem.setShopRefillTime(FPS * 30);
				break;
				case 8:
					_returnItem = new Obtainable();
					_returnItem.setItemStackable(true);
					_returnItem.setItemTag("carp");
					(_returnItem as Obtainable).setDifficulty(1);
					(_returnItem as Obtainable).setMaxLevelForExp(20);
					(_returnItem as Obtainable).setExpGiven(1);
				break;
				case 9:
					_returnItem = new EconomyEquipment();
					_returnItem.setItemTag("wooden rod");
					(_returnItem as EconomyEquipment).setPotency(0);
				break;
				default:
				break;
			}

			return _returnItem;
		}
	}
}