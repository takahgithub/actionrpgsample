// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER

sprMove = spr_slime
sprAttack = spr_slimeAttack
sprHurt = spr_slimeHurt

enemyScript[ENEMYSTATE.WANDER] = SlimeWander
enemyScript[ENEMYSTATE.CHASE] = SlimeChase
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack
enemyScript[ENEMYSTATE.HURT] = SlimeHurt
enemyScript[ENEMYSTATE.DIE] = SlimeDie
