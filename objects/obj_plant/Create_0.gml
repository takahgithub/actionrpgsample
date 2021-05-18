// Inherit the parent event
event_inherited();

entityDropList = choose
(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_bombDrop],
	-1,
	-1,
	-1
)