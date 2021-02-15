if (instance_exists(obj_player) && position_meeting(obj_player.x, obj_player.y, id))
{
	global.targetRoom = TARGET_ROOM
	global.targetX = TARGET_X
	global.targetY = TARGET_Y
	global.targetDirection = obj_player.direction
	room_goto(TARGET_ROOM)
	instance_destroy()
}