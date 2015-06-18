package src
{
	import flash.display.MovieClip;
	
	/*
		Singleton class that allows for global access of the main root class
	*/
	public class MainSingleton
	{
		public static var main:MovieClip;
		public static function set(main:MovieClip)
		{
			MainSingleton.main = main;
		}

		public static function get():MovieClip
		{
			return main;
		}
	}
}