package bin
{
	public class ItemFactory
	{
		private const FPS:Number = 30.00;
		private var itemID:Number;
		private var itemStackable:Boolean = true;
		public function ItemFactory() {}
		public static function getItemData(_itemID:Number):Item
		{
			var _returnItem:Item;
			_returnItem.setItemID(_itemID);
			_returnItem.setStackable(false);
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
				default:
				break;
			}
		}
	}
}