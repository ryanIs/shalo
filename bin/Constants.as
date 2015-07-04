package bin
{
	/*
		Housing for immutable data
	*/
	public class Constants
	{
		//number of tiles
		public static const NUMBER_OF_TILES_X:Number = 9;
		public static const NUMBER_OF_TILES_Y:Number = 7;  

		//modes
		public static const CAMPAIGN_MODE:Number = 0;  
		public static const ONLINE_MODE:Number = 1;  
		public static const CHALLENGE_MODE:Number = 2;  

		//classes/model number
		public static const CLASS_FIGHTER:Number = 0;
		public static const CLASS_COMMONER:Number = 1;
		public static const CLASS_SHOPKEEPER:Number = 2;

		//directions
		public static const DIRECTION_UP:Number = 0;
		public static const DIRECTION_RIGHT:Number = 1;
		public static const DIRECTION_DOWN:Number = 2;
		public static const DIRECTION_LEFT:Number = 3;


		//non-collidable tiles
		public static const NON_COLLIDABLE_TILES:Array = [SimpleRock, SimpleFenceUpRight, SimpleFenceUpDown, SimpleFenceLeftRight];
	
		public static const NPC_MOVEMENT_MEDIUM:Number = 4000;

		public static const HP:String = "hp";
		public static const RESOURCE:String = "resource";
			public static const MANA:String = "mp";
			public static const STACKS:String = "stacks";
			public static const RAGE:String = "rage";
		public static const PHYSICAL_DAMAGE:String = "physical damage";
		public static const MAGICAL_DAMAGE:String = "magical damage";
		public static const CRITICAL:String = "critical";
		public static const DODGE:String = "dodge";
		public static const PHYSICAL_DEFENCE:String = "physical defence";
		public static const MAGICAL_DEFENCE:String = "magical defence";
		public static const ABT:String = "active battle time";
		public static const MOVEMENT_SPEED:String = "movement speed";
		public static const TEMPO:String = "tempo"

	}
}