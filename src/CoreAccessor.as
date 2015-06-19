package src
{
	import flash.display.MovieClip;
	
	/*
		Singleton class that allows for global access of the main root class
	*/
	public class CoreAccessor
	{
		
		private static var main:MovieClip;
		private static var driver:Driver;

		public static function setMain(main:MovieClip):void
		{
			CoreAccessors.main = main;
		}

		public static function getMain():MovieClip
		{
			return main;
		}

		public static function setDriver(main:MovieClip):void
		{
			CoreAccessors.driver = driver;
		}

		public static function getDriver():Driver
		{
			return driver;
		}


	}
}