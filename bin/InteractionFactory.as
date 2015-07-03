package bin
{
	/*
		Housing for immutable data
	*/
	public class InteractionFactory
	{
		public function InteractionFactory(){}
		public static function getInteraction(_interactionID:Number):Array 
		{
			// {npc name, npc dialogue, dialogue type (1-4), next id}
			var _interactionObj:Array = new Array();
			var _subObj:Object;
			switch(_interactionID)
			{
				case 0: // interacting wtih some basic guy
					_subObj = new Object();
					_subObj.npcName = "Bill";
					_subObj.npcDialogue = "Hello world!";
					_subObj.npcDialogueOptions = 1;
					_subObj.npcDialogueOptionNames = ["Continue", "", "", ""];
					_subObj.npcDialogueGoto = 1;
					_interactionObj.push(_subObj);
					_subObj = new Object();
					_subObj.npcName = "Bill";
					_subObj.npcDialogue = "Second Page.";
					_subObj.npcDialogueOptions = 1;
					_subObj.npcDialogueOptionNames = ["Continue", "", "", ""];
					_subObj.npcDialogueGoto = -1;
					_interactionObj.push(_subObj);
				break;
				default:
					return _interactionObj;
			}
			return _interactionObj;
		}
	}
}