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
	
	if (keyAttack)
	{
		state = PlayerStateAttack
		stateAttack = AttackSlash
	}
	
	if (keyActivate)
	{
		var _activateX = x + lengthdir_x(20, direction)
		var _activateY = y + lengthdir_y(20, direction)
		var _activateSize = 8
		var _activateList = ds_list_create()
		activate = noone
		
		// 近くにあるエンティティを全て取得して_activateListに格納
		// 自分の前方の、正方形の領域内にあるエンティティを探す
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			obj_parentEntity,
			false,
			true,
			_activateList,
			true
		)
		
		// 近くにあるエンティティの中から次の2条件に合致するものを探す
		// 複数ある場合は先勝ち。どのオブジェクトが先になるかはよくわからない
		// ・今自分が持っているオブジェクトではない場合
		// ・アクションボタンを押したときに実行すべき処理がある場合
		while (_entitiesFound > 0)
		{
			var _check = _activateList[| --_entitiesFound]
			if ((_check != global.iLifted) && (_check.ENTITY_ACTIVATE_SCRIPT != -1))
			{
				activate = _check
				break
			}
		}
		
		ds_list_destroy(_activateList)

		// 近くにアクション対象のものがない場合、またはあったとしても実行すべき処理がない場合
		if ((activate == noone) || (activate.ENTITY_ACTIVATE_SCRIPT == -1))
		{
			// 何かものを持っていれば投げる
			if (global.iLifted != noone)
			{
				PlayerThrow()
			}
			// それ以外の場合はRoll状態に遷移する
			else
			{
				state = PlayerStateRoll
				moveDistanceRemaining = PLAYER_ROLLDISTANCE
			}
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
	
	if (keyItem && !keyActivate && global.playerHasAnyItems && (global.playerEquipped != ITEM.NONE))
	{
		switch (global.playerEquipped)
		{
			case ITEM.BOMB:
				UseItemBomb()
				break
			case ITEM.BOW:
				UseItemBow()
				break
			case ITEM.HOOK:
				UseItemHook()
				break
			default:
				break
		}
	}
	
	// アイテムの切り替え
	if (global.playerHasAnyItems)
	{
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown
		if (_cycleDirection != 0)
		{
			do
			{
				global.playerEquipped += _cycleDirection
				if (global.playerEquipped < 1)
				{
					global.playerEquipped = ITEM.TYPE_COUNT-1
				}
				if (global.playerEquipped >= ITEM.TYPE_COUNT)
				{
					global.playerEquipped = 1
				}
			}
			until (global.playerItemUnlocked[global.playerEquipped])
		}
	}
}