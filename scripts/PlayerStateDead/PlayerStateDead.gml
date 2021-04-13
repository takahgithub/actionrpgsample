function PlayerStateDead(){
	hSpeed = 0
	vSpeed = 0
	
	// PlayerStateDeadに遷移した時に一度だけ実行される
	if ((sprite_index != spr_playerDie) && (sprite_index != spr_playerDead))
	{
		sprite_index = spr_playerDie
		image_index = 0
		image_speed = 0.7
	}
	
	// Spriteの最後の画像を表示しているとき
	if ((image_index + image_speed) > image_number)
	{
		if (sprite_index == spr_playerDie)
		{
			image_speed = max(0, image_speed - 0.03)
			if (image_speed < 0.07)
			{
				image_index = 0
				sprite_index = spr_playerDead
				image_speed = 1.0
			}
		}
		else
		{
			image_speed = 0
			image_index = image_number - 1
			global.targetX = -1
			global.targetY = -1
			RoomTransition(TRANS_TYPE.SLIDE, r_sample)
		}
	}
}