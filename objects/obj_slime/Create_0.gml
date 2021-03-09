// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER

sprMove = spr_slime
sprAttack = spr_slimeAttack

enemyScript[ENEMYSTATE.WANDER] = SlimeWander
enemyScript[ENEMYSTATE.CHASE] = SlimeChase
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack