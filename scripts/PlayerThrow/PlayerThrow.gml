function PlayerThrow(){
	with (global.iLifted)
	{
		lifted = false
		persistent = false
		thrown = true
		z = CARRY_HEIGHT
		throwPeakHeight = z + 20
		throwDistance = ENTITY_THROW_DISTANCE
		throwDistanceTravelled = 0
		throwStartPercent = (13 / throwPeakHeight) * 0.5
		throwPercent = throwStartPercent
		direction = other.direction
		xstart = x
		ystart = y
	}
	
	PlayerActOutAnimation(spr_playerLift)
	global.iLifted = noone
}