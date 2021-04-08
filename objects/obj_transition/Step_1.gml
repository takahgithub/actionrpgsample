with (obj_player)
{
	if (state != PlayerStateDead)
	{
		state = PlayerStateTransition
	}
}

// 部屋から出るときの処理。percentを増やしていき、1になったら部屋遷移する。
// エフェクトの描画はDraw GUIイベントにて。
if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED)
	if (percent >= 1)
	{
		room_goto(target)
		leading = IN
	}
}
// 部屋に入るときの処理。percentを減らしていき、0になったらインスタンス削除して終了。
// エフェクトの描画はDraw GUIイベントにて。
else
{
	percent = max(0, percent - TRANSITION_SPEED)
	if (percent <= 0)
	{
		with (obj_player)
		{
			state = PlayerStateFree
		}
		instance_destroy()
	}
}