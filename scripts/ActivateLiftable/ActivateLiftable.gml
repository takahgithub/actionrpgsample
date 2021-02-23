function ActivateLiftable(_lifted){
	if (global.iLifted == noone)
	{
		PlayerActOutAnimation(spr_playerLift)
		global.iLifted = _lifted
		with (global.iLifted)
		{
			lifted = true
			persistent = true
		}
	}
		
}