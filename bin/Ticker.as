package bin{
    import flash.utils.*;
    public class Ticker {
    	//{ region private vars
    		private var _interval:int;
    		private var _tick:uint = 0;
    		private var _tickLength:Number;
    		private var _callBacks:Dictionary;
    	//} endregion
    	public function Ticker(tickLength:Number = 0) {
    		this.tickLength = tickLength;
    		this._callBacks = new Dictionary();
    	}
    	//{ region accessors
    		/**
    		 * the current tick
    		 */
    		public function get tick():uint { return _tick; }
    		/**
    		 * the tick length. set to a non-positive value, to stop ticking
    		 */
    		public function get tickLength():Number { return _tickLength; }
    		public function set tickLength(value:Number):void {
    			if (this._tickLength > 0) clearInterval(this._interval);
    			if ((this._tickLength = value) > 0) this._interval = setInterval(this.doTick, value);
    		}		
    	//} endregion
    	/**
    	 * add a callback, to be called with every tick
    	 * @param	callback function (tick:int):*
    	 */
    	public function addCallback(callback:Function):void {
    		this._callBacks[callback] = callback;
    	}
    	/**
    	 * removes a callback previously added and returns true on success, false otherwise
    	 * @param	callback
    	 * @return
    	 */
    	public function removeCallback(callback:Function):Boolean {
    		return delete this._callBacks[callback];
    	}
    	/**
    	 * executes a tick. actually this happens automatically, but if you want to, you can set tickLength to a non-positive value and then execute ticks manually, if needed
    	 */
    	public function doTick():void {
    		var tick:uint = this._tick++;//actually, this is only superspicion ... amazingly, this makes no difference really ... :D
    		for each (var callback:* in this._callBacks) callback(tick);
    	}
    }
}