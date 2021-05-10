// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER

sprMove = spr_slime
sprAttack = spr_slimeAttack
sprHurt = spr_slimeHurt
sprDie = spr_slimeDie

enemyScript[ENEMYSTATE.WANDER] = SlimeWander
enemyScript[ENEMYSTATE.CHASE] = SlimeChase
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie

entityDropList = choose
(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_bombDrop],
	-1,
	-1,
	-1
)