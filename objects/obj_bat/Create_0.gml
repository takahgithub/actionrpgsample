// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER

sprMove = spr_bat
sprAttack = spr_bat
sprHurt = spr_batHurt
sprDie = spr_batDie

enemyScript[ENEMYSTATE.WANDER] = BatWander
enemyScript[ENEMYSTATE.CHASE] = BatChase
enemyScript[ENEMYSTATE.ATTACK] = -1
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie

entityDropList = choose
(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_bombDrop],
	[obj_arrowDrop],
	-1,
	-1
)