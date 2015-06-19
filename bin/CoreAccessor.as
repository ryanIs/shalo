package bin
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
			CoreAccessor.main = main;
		}

		public static function getMain():MovieClip
		{
			return main;
		}

		public static function setDriver(driver:Driver):void
		{
			CoreAccessor.driver = driver;
		}

		public static function getDriver():Driver
		{
			return driver;
		}


	}
}