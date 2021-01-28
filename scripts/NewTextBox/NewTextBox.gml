function NewTextBox(_drawMessage, _background){
	var _obj
	// すでに表示中のメッセージがある場合はキューに積んでおく
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
		
		// 第三引数が指定されていれば。もっといい書き方がありそう。
		// 第三引数は選択肢のリスト。第三引数が指定されている場合は選択肢有りのメッセージを表示するということ。
		if (argument_count > 2)
		{
			responses = argument[2]
			for (var i = 0; i < array_length(responses); i++)
			{
				var _markerPosition = string_pos(":", responses[i])
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1)
				responseScripts[i] = real(responseScripts[i])
				responses[i] = string_delete(responses[i], 1, _markerPosition)
			}
		}
		else
		{
			responses = [-1]
			responseScripts = [-1]
		}
	}
	
	// メッセージ表示中はプレイヤーは動かないようにする
	with (obj_player)
	{
		if (state != PlayerStateLocked)
		{
			lastState = state
			state = PlayerStateLocked
		}
	}
}