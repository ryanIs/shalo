package bin
{
	import flash.display.*;
	import flash.events.*;

	public class Main extends MovieClip
	{
		// CONFIG VARS
		public var LOAD_COMPLETE:Boolean = true;
		private const DEBUG:Boolean = true;
		private var debugFrame:String = "game";
		
		// GAME VARS
		public var dialogue:Array = new Array();
		public var dialogueIndex:Number = -1;
		public var talkingWith:Humanoid = null;
		public var transition_frame:String = "load";
		private var campaignDriver:CampaignDriver;

		public function Main()
		{
			//The main
			stop();
			CoreAccessor.setMain(this);
			if(LOAD_COMPLETE == false) {
				bar_mc.bar_mc.scaleX = 0;
				loaderInfo.addEventListener(ProgressEvent.PROGRESS, loadHandler);
			} else {
				gotoAndPlay(2);
			}
		}
		public function startDialogue(_dialogue:Array, _talkingWith:Humanoid):void 
		{
			dialogue = _dialogue;
			talkingWith = _talkingWith;
			if(campaignDriver.getHero() != null && _talkingWith != null)
			campaignDriver.getHero().getMover().setTalkingWith(_talkingWith);
			
			processDialogue(0);
			return;
		}
		public function processDialogue(_set:Number):void 
		{
			dialogueIndex = _set;
			if(dialogueIndex >= dialogue.length || dialogueIndex == -1)
			{
				endDialogue();
			} 
			else
			{
				interface_mc.dialogue_mc.visible = true;
				interface_mc.dialogue_mc.name_txt.text = dialogue[dialogueIndex].npcName;
				interface_mc.dialogue_mc.dialogue_txt.text = dialogue[dialogueIndex].npcDialogue;
				interface_mc.dialogue_mc.buttons_mc.gotoAndStop(dialogue[dialogueIndex].npcDialogueOptions);
				for(var i:Number = 0; i < dialogue[dialogueIndex].npcDialogueOptions; i++) {
					var _f:Function = function(e:MouseEvent):void
					{
						processDialogue(dialogue[dialogueIndex].npcDialogueGoto);
						interface_mc.dialogue_mc.buttons_mc[e.currentTarget.name].removeEventListener(MouseEvent.CLICK, _f);
						return;
					}; 
					interface_mc.dialogue_mc.buttons_mc["b" + i + "_btn"].addEventListener(MouseEvent.CLICK, _f); 
					interface_mc.dialogue_mc.buttons_mc["b" + i + "_txt"].text = dialogue[dialogueIndex].npcDialogueOptionNames[i];
				}
			}
			return;
		}
		public function endDialogue():void
		{
			interface_mc.dialogue_mc.visible = false;
			campaignDriver.getHero().getMover().setTalkingWith(null);
			if(talkingWith != null)
			talkingWith.getMover().setTalkingWith(null);
			return;
		}
		public function loadFrame():void {
			if(currentLabel == "debugLoad") {
				if(DEBUG) {
					gotoAndStop(debugFrame);
					setDriver(Constants.CAMPAIGN_MODE);
					CoreAccessor.getDriver().run();
				}
			} else if(currentLabel == "game") {
				interface_mc.dialogue_mc.visible = false;
			}
			return;
		}
		public function trans(to_frame:String):void {
			transition_frame = to_frame;
			if(trans_mc != null) {
				trans_mc.gotoAndPlay(2);
			}
			return;
		}
		public function loadHandler(e:ProgressEvent):void {
			var load_progress:Number = e.bytesLoaded / e.bytesTotal;
			bar_mc.bar_mc.scaleX = load_progress;
			if(load_progress == 1.00) {
				loaderInfo.removeEventListener(ProgressEvent.PROGRESS, loadHandler);
				LOAD_COMPLETE = true;
				if(DEBUG)
				{
					gotoAndPlay(2);
				}
				else
				{
					gotoAndPlay(2);
				}
			}
			return;
		}

		/*
			Selects the operating class to control the games functionality
		*/
		private function setDriver(driver:Number)
		{
			switch(driver)
			{
				case Constants.CAMPAIGN_MODE:
					CoreAccessor.setDriver(campaignDriver = new CampaignDriver());
				break;
				/*
				case Conastants.ONLINE_MODE:
					CoreAccessor.setDriver(new OnlineDriver());
				break;
				case Conastants.CHALLENGE_MODE:
					CoreAccessor.setDriver(new ChallengeDriver());
				break;
				*/
			}
		}
	}
}
