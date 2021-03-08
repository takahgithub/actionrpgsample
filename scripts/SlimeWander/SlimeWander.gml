function SlimeWander(){
	sprite_index = sprMove
	
	// 今の移動先に到達したら、または移動する最大距離に到達したら
	if (((x == xTo) && (y == yTo)) || (timePassed > (ENEMY_WANDER_DISTANCE / ENEMY_SPEED)))
	{
		hSpeed = 0
		vSpeed = 0
		// アニメーションを切りのいいところで止める
		if (image_index < 1)
		{
			image_speed = 0.0
			image_index = 0
		}
		
		// 次の行先を決める
		if (++wait >= waitDuration)
		{
			wait = 0
			timePassed = 0
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45)
			xTo = x + lengthdir_x(ENEMY_WANDER_DISTANCE, dir)
			yTo = y + lengthdir_y(ENEMY_WANDER_DISTANCE, dir)
		}
	}
	// 決まった移動先まで移動する
	else
	{
		timePassed++
		// アニメーションを動かす
		image_speed = 1.0
		var _distanceToGo = point_distance(x, y, xTo, yTo)
		var _speedThisFrame = ENEMY_SPEED
		if (_distanceToGo < ENEMY_SPEED)
		{
			_speedThisFrame = _distanceToGo
		}
		dir = point_direction(x, y, xTo, yTo)
		hSpeed = lengthdir_x(_speedThisFrame, dir)
		vSpeed = lengthdir_y(_speedThisFrame, dir)
		// 移動する方向に応じてスプライトの向きを変える
		if (hSpeed != 0)
		{
			image_xscale = sign(hSpeed)
		}
		
		// タイルとの衝突判定と移動
		var _collided = EnemyTileCollision()
	}
	
	// 近くにプレイヤーがいるか探す
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0
		if (instance_exists(obj_player) 
			&& (point_distance(x, y, obj_player.x, obj_player.y) <= ENEMY_AGGRO_RADIUS))
		{
			state = ENEMYSTATE.CHASE
			target = obj_player
		}
	}
}