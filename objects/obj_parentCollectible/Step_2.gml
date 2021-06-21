flash = max(0, flash - 0.05)
fric = 0.05
if (z == 0)
{
	fric = 0.10
}

if (instance_exists(obj_player))
{
	var _px = obj_player.x
	var _py = obj_player.y
	var _dist = point_distance(x, y, _px, _py)
	if (_dist < 16)
	{
		spd += 0.25
		direction = point_direction(x, y, _px, _py)
		spd = min(spd, 3)
		fric = 0
		if (_dist < 5)
		{
			if (COLLECT_SCRIPT_ARG != -1)
			{
				script_execute(COLLECT_SCRIPT, COLLECT_SCRIPT_ARG)
			}
			else
			{
				if (COLLECT_SCRIPT != -1)
				{
					script_execute(COLLECT_SCRIPT)
				}
			}
			instance_destroy()
		}
	}
}

// Bounce
if (bounceCount != 0)
{
	bounce += (pi * BOUNCE_SPEED)
	if (bounce > pi)
	{
		bounce -= pi
		bounceHeight *= 0.6
		bounceCount--
	}
	z = sin(bounce) * bounceHeight
}
else
{
	z = 0
}

x += lengthdir_x(spd, direction)
y += lengthdir_y(spd, direction)
spd = max(spd - fric, 0)
depth = -bbox_bottom
