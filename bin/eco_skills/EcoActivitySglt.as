package bin.eco_skills
{
	import bin.*;
	import bin.actors.*;

	public class EcoActivitySglt
	{	
		private static var i:EconomyActivity;
		public static function get():EconomyActivity
		{
			if(i == null)
			{
				i = new EconomyActivity();
			}
			return i;
		}
	}

}