package bin
{
	public class Item
	{
		protected var itemID:Number;
		protected var itemTag:String;
		protected var itemStackable:Boolean = true;
		protected var itemShopRefillTime:Number;
		public var itemShopRefillTimer:Number = 0;
		public function Item(){}
		public function getItemTag():String 
		{
			return itemTag;
		}
		public function getItemID():Number 
		{
			return itemID;
		}
		public function setItemTag(_itemTag:String):void 
		{
			itemTag = _itemTag;
		}
		public function setItemID(_itemID:Number):void 
		{
			itemID = _itemID;
		}
		public function getItemStackable():Boolean
		{
			return itemStackable;
		}
		public function setItemStackable(_itemStackable:Boolean):void 
		{
			itemStackable = _itemStackable;
		}
		public function setShopRefillTime(num:Number):void 
		{
			itemShopRefillTime = num;
		}
	}
}