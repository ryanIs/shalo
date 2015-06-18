package src
{
	import flash.display.*;
	import flash.utils.setTimeout;

	public class Main extends MovieClip
	{

		public function Main()
		{
			MainSingleton.set(this);

			ZoneFactory.zone(2);

			stop();
		}
	}
}
