package bin.actors
{
	import bin.*;
	import flash.events.KeyboardEvent;
	import flash.utils.setTimeout;

	/*
		Represents a Non-player character
	*/
	public class NPCMover extends Mover
	{
		public function NPCMover(classType:Number, args:Object = null)
		{
			super(classType);
			setDisplayArgs(args);
		}
	}
}