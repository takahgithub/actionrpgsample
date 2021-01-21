function NewTextBox(_drawMessage, _background){
	var _obj
	if (instance_exists(obj_text))
	{
		_obj = obj_textQueued
	}
	else
	{
		_obj = obj_text
	}
	
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		drawMessage = _drawMessage
		if (instance_exists(other))
		{
			originInstance = other.id
		}
		else
		{
			originInstance = noone
		}
		
		background = _background
	}
	
	with (obj_player)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state
			state = PlayerStateLocked
		}
	}
}