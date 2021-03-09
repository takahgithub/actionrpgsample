function EnemyWait(){
	// 少し待った後、次の状態に遷移する
	if (++stateWait >= stateWaitDuration)
	{
		stateWait = 0
		state = stateTarget
	}
}