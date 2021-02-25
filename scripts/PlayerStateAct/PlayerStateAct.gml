function PlayerStateAct(){
	PlayerAnimateSprite()
	
	if (animationEnd)
	{
		state = PlayerStateFree
		animationEnd = false
		if (animationEndScript != -1)
		{
			ScriptExecuteArray(animationEndScript, animationEndScriptArgs)
			animationEndScript = -1
			animationEndScriptArgs = []
		}
	}
}