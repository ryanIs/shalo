package bin.eco_skills
{
	import bin.*;
	import bin.actors.*;
	import flash.utils.setTimeout;
	import flash.utils.setInterval;
	import flash.utils.clearInterval;
	import flash.utils.clearTimeout;

	/*
		Represents the motions of all possible economy activities
	*/
	public class EconomyActivity
	{
		private var actTimerTimeout:uint;
		private var actTimerInterval:uint;
		public function EconomyActivity(){}

		/*
			Fishing
		*/
		public function fishingActivity(fishingSkill:EconomySkill, fish:Obtainable, rod:EconomyEquipment):void
		{
			var baseFishingTimeSec:Number = 2;
			var waitTime:Number;
			var maxFish:Number;

			switch(fish.getItemTag())
			{
				case "carp":
					maxFish = Math.random() * 5 + Math.floor(fishingSkill.getLevel() / 5);
					waitTime = baseFishingTimeSec + (2 / (100 -  (fishingSkill.getLevel() * 15) / 10 ) )
				break;
			}

			var _this = this;
			actTimerInterval = setInterval(function()
			{
				(CoreAccessor.getDriver() as CampaignDriver).getHero().addItem(fish.getItemID());
				fishingSkill.gainExp(fish.getExpGiven(fishingSkill.getLevel()));
				maxFish--;
				if(maxFish <= 0)
				{
					_this.cancelActivity();
					CoreAccessor.getDriver() as CampaignDriver).getHero().setCurrentActivity("done fishing");
				}
			}, waitTime * 1000);

		}

		/*
			Cancel all current activities
		*/
		public function cancelActivity()
		{
			clearInterval(actTimerInterval);
			clearInterval(actTimerTimeout);
		}

	}

}