if (!global.gamePaused)
{
	depth = -bbox_bottom
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
