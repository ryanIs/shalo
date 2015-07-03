package bin
{
	import bin.actors.*;

	/*
		Storage place for zone NPC, and NPCEnemies characters
		[CLASSTYPE, X, Y]
	*/
	public class ZoneCharacterBank
	{

		static const IXEL_FIELDS_ROADS_END:Array = [
			[null,null,null,null,new NPC(Constants.CLASS_COMMONER, { "direction" : Constants.DIRECTION_DOWN }),null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null]
		];
		
		static const IXEL_FIELDS_ORE_SHOP:Array = [
			[null,null,null,null,null,null,null],
			[null,null,null,new NPC(Constants.CLASS_COMMONER, { "direction" : Constants.DIRECTION_DOWN }),null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null],
			[null,null,null,null,null,null,null]
		];

		static const IXEL_FIELDS_PATH_0:Array = [];
	}
}