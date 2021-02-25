function PlayerActOutAnimation(_sprite_index){
	state = PlayerStateAct
	sprite_index = _sprite_index
	//if (!is_undefined(argument[1]))
	if (argument_count > 1)
	{
		animationEndScript = argument[1]
	}
	else
	{
		animationEndScript = -1
	}
	
	//if (!is_undefined(argument[2]))
	if (argument_count > 2)
	{
		animationEndScriptArgs = argument[2]
	}
	else
	{
		animationEndScriptArgs = []
	}
	
	localFrame = 0
	image_index = 0
	PlayerAnimateSprite()
}