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
		var _activateX = lengthdir_x(20, direction)
		var _activateY = lengthdir_y(20, direction)
		activate = instance_position(x+_activateX, y+_activateY, obj_parentEntity)
		
		// 近くにアクション対象のものがなければ、またはあったとしても実行すべき処理がなければ、Roll状態に遷移する
		if ((activate == noone) || (activate.ENTITY_ACTIVATE_SCRIPT == -1))
		{
			state = PlayerStateRoll
			moveDistanceRemaining = PLAYER_ROLLDISTANCE
		}
		// もしあれば、設定された処理を実行する
		else
		{
			ScriptExecuteArray(activate.ENTITY_ACTIVATE_SCRIPT, activate.ENTITY_ACTIVATE_ARGS)
		
			// NPCの場合はプレイヤーの方向を向かせる
			if (activate.ENTITY_NPC)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y)
					image_index = CARDINAL_DIR
				}
			}
		}
		
		
	}
}
