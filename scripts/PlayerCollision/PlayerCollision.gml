// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false
	
	if (tilemap_get_at_pixel(collisionMap, x + hspeed, y))
	{
		x -= x mod TILE_SIZE
		if (sign(hspeed) == 1)
		{
			x += TILE_SIZE - 1
		}
		hspeed = 0
		_collision = true
	}
	
	if (tilemap_get_at_pixel(collisionMap, x, y + vspeed))
	{
		y -= y mod TILE_SIZE
		if (sign(vspeed) == 1)
		{
			y += TILE_SIZE - 1
		}
		vspeed = 0
		_collision = true
	}
	
	return _collision
}