lerpProgress += (1 - lerpProgress) / 50
textProgress += global.textSpeed

x1 = lerp(x1, x1Target, lerpProgress)
x2 = lerp(x2, x2Target, lerpProgress)

// 選択肢を選ぶ
keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))
keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))
responseSelected += (keyDown - keyUp)

// 選択肢の数を超えないように、一番下に行ったら上に戻ったり、その逆をしたりする
var _max = array_length(responses) - 1
var _min = 0
if (responseSelected > _max)
{
	responseSelected = _min
}
if (responseSelected < _min)
{
	responseSelected = _max
}

// スペースを押したらメッセージが進む
if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(drawMessage)
	// メッセージを表示しきった場合
	if (textProgress >= _messageLength)
	{
		// 選択肢のあるメッセージの場合、選択肢に応じた処理を行う
		if (responses[0] != -1)
		{
			with (originInstance)
			{
				DialogueResponses(other.responseScripts[other.responseSelected])
			}
		}
		
		// メッセージを消す
		instance_destroy()
		// キューにメッセージが積まれている場合は、キューの待ち順番を更新する
		if (instance_exists(obj_textQueued))
		{
			with (obj_textQueued)
			{
				ticket--
			}
		}
		// そうでない場合はメッセージ表示が終わりなので、プレイヤーをもとの状態に戻す
		else
		{
			with (obj_player)
			{
				state = lastState
			}
		}
	}
	// まだメッセージがすべて表示されていない場合は何もしない
	else
	{
		if (textProgress > 2)
		{
			textProgress = _messageLength
		}
	}
}