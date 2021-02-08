// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerStateBonk(){
	hSpeed = lengthdir_x(PLAYER_BONKSPEED, direction-180)
	vSpeed = lengthdir_y(PLAYER_BONKSPEED, direction-180)
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - PLAYER_BONKSPEED)
	var _collided = PlayerCollision()
	
	// Spriteの更新
	sprite_index = spriteBonk
	// Imageの更新
	image_index = CARDINAL_DIR
	
	// 高さの設定
	z = sin((moveDistanceRemaining / PLAYER_BONKDISTANCE) * pi) * PLAYER_BONKHEIGHT
	
	// state遷移
	if (moveDistanceRemaining <= 0)
	{
		state = PlayerStateFree
	}
}