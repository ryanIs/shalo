package src
{
	/*
		Represents both all players, NPCS, enemies, and the visual tiles they stand on
	*/
	public class Zone
	{
		private var visuLocation:Array;
		private var charLocation:Array;
		private var zoneTitle:String;
		
		/*
			Initialize the zone
		*/
		public function Zone(zoneTitle:String, visuLocation:Array, charLocation:Array)
		{
			this.visuLocation = visuLocation;
			this.charLocation = charLocation;
			this.zoneTitle = zoneTitle;
		}
	}
}