package bin
{
	import flash.display.MovieClip;
	import flash.events.*;
	import bin.actors.Mover;

	public class Humanoid extends MovieClip
	{
		public var type:Number;
		public var typeTag:String;
		public var mover:Mover;
		public function Humanoid(){}
		public function getMover():Mover {
			return mover;
		}
		public function setMover(_set:Mover):void {
			mover = _set;
			return;
		}
		private function getIDforTag(_tag:String):Number {
			var _ID:Number = -1;
			if(_tag == "hero") {
				_ID = 0;
			} else if(_tag == "commoner") {
				_ID = 1;
				getMover().setTalkCommand(0);
			} else if(_tag == "shopKeeper") {
				_ID = 2;
				getMover().setTalkCommand(0);
			}
			return _ID;
		}
		public function initHumanoid(_typeTag:String, _MOVER:Mover):void {
			typeTag = _typeTag; 
			mover = _MOVER;
			type =  getIDforTag(typeTag);
			if(mover.talkCommand != -1) {
				addEventListener(MouseEvent.CLICK, clickHandler);
			}
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			return;
		}
		public function enterFrameHandler(e:Event):void {
			humanoid_mc.head_mc.gotoAndStop(typeTag);
			humanoid_mc.body_mc.gotoAndStop(typeTag);
			humanoid_mc.main_mc.gotoAndStop(typeTag);
			humanoid_mc.off_mc.gotoAndStop(typeTag);
			return;
		}
		public function clickHandler(e:MouseEvent):void {
			if(mover.talkCommand != -1) {
				CoreAccessor.getMain().startDialogue(InteractionFactory.getInteraction(mover.talkCommand), this);
			}
			return;
		}
	}
}