// Inherit the parent event
event_inherited();

state = ENEMYSTATE.IDLE
hSpeed = 0
vSpeed = 0
xTo = xstart
yTo = ystart
dir = 0
aggroCheck = 0
aggroCheckDuration = 5
stateTarget = state
statePrevious = state
stateWait = 0
stateWaitDuration = 0

timePassed = 0
waitDuration = 60
wait = 0

sprMove = spr_slime

enemyScript[ENEMYSTATE.IDLE] = -1
enemyScript[ENEMYSTATE.WANDER] = -1
enemyScript[ENEMYSTATE.CHASE] = -1
enemyScript[ENEMYSTATE.ATTACK] = -1
enemyScript[ENEMYSTATE.HURT] = -1
enemyScript[ENEMYSTATE.DIE] = -1
enemyScript[ENEMYSTATE.WAIT] = EnemyWait