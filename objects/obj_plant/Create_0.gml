// Inherit the parent event
event_inherited();

entityDropList = choose
(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_bombDrop],
	[obj_arrowDrop],
	-1,
	-1
)