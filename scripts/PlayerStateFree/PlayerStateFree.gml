function PlayerStateFree(){
	hSpeed = lengthdir_x(inputMagnitude * PLAYER_MOVESPEED, inputDirection)
	vSpeed = lengthdir_y(inputMagnitude * PLAYER_MOVESPEED, inputDirection)
	
	PlayerCollision()
	
	// Sprite Index更新
	var _oldSprite = sprite_index
	if (inputMagnitude != 0)
	{
		direction = inputDirection
		sprite_index = spriteRun
	}
	else
	{
		sprite_index = spriteIdle
	}
	if (_oldSprite != sprite_index)
	{
		localFrame = 0
	}

	// Image Indexの更新
	PlayerAnimateSprite()
	
	if (keyActivate)
	{
		state = PlayerStateRoll
		moveDistanceRemaining = PLAYER_ROLLDISTANCE
	}
}
