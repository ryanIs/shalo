package bin
{
	public class Shop
	{
		private var shopID:Number;
		private var shopName:String;
		private const MAX_SHOP_ITEMS:Number = 64;
		public var shopItems:Array = new Array(MAX_SHOP_ITEMS);
		public var shopItemsQ:Array = new Array(MAX_SHOP_ITEMS);
		public function Shop(_shopID:Number) {
			shopID = _shopID;
		}
		public function getShopName():String {
			return shopName;
		}
		public function getShopID():Number {
			return shopID;
		}
		private function itemTimerHandler():void 
		{
			for(var i:Number = 0; i < MAX_SHOP_ITEMS:i++)
			{
				if(shopItems[i] != null) {
					if(++shopItems[i].itemShopRefillTimer > shopItems[i].itemShopRefillTime) {
						shopItems[i].itemShopRefillTimer = 0;
						shopItemsq[i] += 1;
					}
				}
			}
			return;
		}
		// Updates the items within the shop.
		private function updateShop():void 
		{
			return;
		}
		// ran every ten seconds.
		public function process():void
		{
			itemTimerHandler();
			return;
		}
	}
}