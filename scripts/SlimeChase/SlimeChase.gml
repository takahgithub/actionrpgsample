function SlimeChase(){
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
	
	// 追跡するターゲットが攻撃範囲内にいたら
	if (instance_exists(target) && (point_distance(x, y, target.x, target.y) <= ENEMY_ATTACK_RADIUS))
	{
		state = ENEMYSTATE.ATTACK
		sprite_index = sprAttack
		image_index = 0
		image_speed = 1.0
		// 攻撃モーション中にターゲットの方向に少し移動する
		xTo += lengthdir_x(16, dir)
		yTo += lengthdir_y(16, dir)
	}
}