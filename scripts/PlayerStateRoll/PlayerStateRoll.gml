// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateRoll(){
	hSpeed = lengthdir_x(PLAYER_ROLLSPEED, direction)
	vSpeed = lengthdir_y(PLAYER_ROLLSPEED, direction)
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - PLAYER_ROLLSPEED)
	var _collided = PlayerCollision()
	
	// Spriteの更新
	sprite_index = spriteRoll
	var _totalFrames = sprite_get_number(sprite_index) / 4
	
	// Imageの更新
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / PLAYER_ROLLDISTANCE)) * _totalFrames), _totalFrames - 1)
	
	// state遷移
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree
	}
	
	if (_collided)
	{
		state = PlayerStateBonk
		moveDistanceRemaining = PLAYER_BONKDISTANCE
		ScreenShake(8, 30)
	}
}