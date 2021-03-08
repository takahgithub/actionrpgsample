#macro TILE_SIZE 32
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START r_sample
#macro TEXT_SPEED 0.75
#macro RESOLUTION_W 640
#macro RESOLUTION_H 480
#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1
#macro CARRY_HEIGHT 30

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}