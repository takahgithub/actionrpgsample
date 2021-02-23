if (!global.gamePaused)
{
	depth = -bbox_bottom
	if (lifted && instance_exists(obj_player))
	{
		if (obj_player.sprite_index != spr_playerLift)
		{
			x = obj_player.x
			y = obj_player.y
			z = 30
			depth = obj_player.depth - 1
		}
	}
}

flash = max(flash - 0.03, 0)
