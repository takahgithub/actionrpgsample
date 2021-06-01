function BatChase(){
	sprite_index = sprMove
	if (instance_exists(target))
	{
		xTo = target.x
		yTo = target.y
		
		var _distanceToGo = point_distance(x, y, xTo, yTo)
		image_speed = 1.0
		dir = point_direction(x, y, xTo, yTo)
		if (_distanceToGo > ENEMY_SPEED)
		{
			hSpeed = lengthdir_x(ENEMY_SPEED, dir)
			vSpeed = lengthdir_y(ENEMY_SPEED, dir)
		}
		else
		{
			hSpeed = lengthdir_x(_distanceToGo, dir)
			vSpeed = lengthdir_y(_distanceToGo, dir)
		}
		
		if (hSpeed != 0)
		{
			image_xscale = sign(hSpeed)
		}
		EnemyTileCollision()
	}
}