function SlimeDie(){
	sprite_index = sprDie
	image_speed = 1.0
	var _distanceToGo = point_distance(x, y, xTo, yTo)
	if (_distanceToGo > ENEMY_SPEED)
	{
		dir = point_direction(x, y, xTo, yTo)
		hSpeed = lengthdir_x(ENEMY_SPEED, dir)
		vSpeed = lengthdir_y(ENEMY_SPEED, dir)
		if (hSpeed != 0)
		{
			image_xscale = -sign(hSpeed)
		}
		
		EnemyTileCollision()
	}
	else
	{
		x = xTo
		y = yTo
	}
	
	if ((image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps))) >= image_number)
	{
		instance_destroy()
	}
}