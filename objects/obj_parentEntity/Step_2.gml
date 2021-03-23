if (!global.gamePaused)
{
	depth = -bbox_bottom
	// 物が持ち上げられている状態
	if (lifted && instance_exists(obj_player))
	{
		if (obj_player.sprite_index != spr_playerLift)
		{
			x = obj_player.x
			y = obj_player.y
			z = CARRY_HEIGHT
			depth = obj_player.depth - 1
		}
	}
	
	if (!lifted)
	{
		// ものが宙を浮いている状態
		if (thrown)
		{
			throwDistanceTravelled = min(throwDistanceTravelled + 3, throwDistance)
			x = xstart + lengthdir_x(throwDistanceTravelled, direction)
			y = ystart + lengthdir_y(throwDistanceTravelled, direction)
			if (tilemap_get_at_pixel(collisionMap, x, y) > 0)
			{
				thrown = false
				grav = 0.1
			}
			
			// lerp([始点の値], [終点の値], [パーセント])
			// lerp(0, 100, 0.5) = 50
			// start = 0.3
			// 0~0.7
			// 0.3 + lerp(0, 0.7, [パーセントを増やしていく])
			throwPercent = throwStartPercent + lerp(0, 1 - throwStartPercent, throwDistanceTravelled / throwDistance)
			z = throwPeakHeight * sin(throwPercent * pi)
			if (throwDistance == throwDistanceTravelled)
			{
				thrown = false
				if (ENTITY_THROW_BREAK)
				{
					instance_destroy()
				}
			}
		}
		else
		{
			// エンティティが投げられていない場合、または投げられた後にCollisionTileにぶつかったらここに来る
			// その場合、床に落ちるまでzを減らしていく
			if (z > 0)
			{
				z = max(z - grav, 0)
				grav += 0.1
				if ((z == 0) && ENTITY_THROW_BREAK)
				{
					instance_destroy()
				}
			}
			else
			{
				grav = 0.1
			}
		}
	}
}

flash = max(flash - 0.03, 0)

// lifted:持ち上げられている状態
// thrown:投げられている状態

// lifted	thrown
// true		true	ない
// true		false	ある
// false	true	ある。宙を飛んでいる状態
// false	false	ある