if (instance_exists(obj_player) && position_meeting(obj_player.x, obj_player.y, id))
{
	if (!instance_exists(obj_transition))
	{
		global.targetRoom = TARGET_ROOM
		global.targetX = TARGET_X
		global.targetY = TARGET_Y
		global.targetDirection = obj_player.direction
		with (obj_player)
		{
			state = PlayerStateTransition
		}
		RoomTransition(TRANS_TYPE.SLIDE, TARGET_ROOM)
		instance_destroy()
	}
}