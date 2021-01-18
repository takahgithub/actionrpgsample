// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimateSprite(){
	var _cardinalDirection = CARDINAL_DIR
	var _totalFrames = sprite_get_number(sprite_index) / 4
	image_index = localFrame + (_cardinalDirection * _totalFrames)
	localFrame += sprite_get_speed(sprite_index) / room_speed
	
	if (localFrame >= _totalFrames)
	{
		animationEnd = true
		localFrame -= _totalFrames
	}
	else
	{
		animationEnd = false	
	}
	
	show_debug_message(string(room_speed))
}