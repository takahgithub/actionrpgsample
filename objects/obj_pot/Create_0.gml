// Inherit the parent event
event_inherited();

entityDropList = choose
(
	[obj_bombDrop],
	[obj_coin, obj_coin],
	[obj_coin, obj_coin, obj_coin]
)