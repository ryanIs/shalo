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

		//directions
		public static const DIRECTION_UP:Number = 0;
		public static const DIRECTION_RIGHT:Number = 1;
		public static const DIRECTION_DOWN:Number = 2;
		public static const DIRECTION_LEFT:Number = 3;


		//non-collidable tiles
		public static const NON_COLLIDABLE_TILES:Array = [SimpleRock, SimpleFenceUpRight, SimpleFenceUpDown, SimpleFenceLeftRight];
	}
}