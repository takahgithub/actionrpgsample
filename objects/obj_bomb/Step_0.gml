event_inherited()

if (!global.gamePaused)
{
	image_speed = bombImageSpeed
	bombTick--
	if (bombTick == 0)
	{
		// flash = 0.75
		bombStage++
		bombTick = bombTickRate[bombStage]
		bombImageSpeed = bombImageSpeeds[bombStage]
	}
	
	// bombStageの最後の時
	if (bombTick < 0)
	{
		y -= z
		if (lifted)
		{
			PlayerDropItem()
		}
		instance_destroy()
	}
}