function ActivateLiftable(_lifted){
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(spr_playerLift)
		
		spriteidle = spr_playerCarrying
		spriteRun = spr_playerRunCarrying
		
		global.iLifted = _lifted
		with (global.iLifted)
		{
			lifted = true
			persistent = true
		}
	}
		
}