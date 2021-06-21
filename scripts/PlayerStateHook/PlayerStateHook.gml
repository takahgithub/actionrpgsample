function PlayerStateHook(){
	// フック射出中は動かない
	hSpeed = 0
	vSpeed = 0
	
	// このステートに遷移してきたときだけ行う処理
	if (sprite_index != spr_playerHook)
	{
		hook = 0
		hookX = 0
		hookY = 0
		hookStatus = HOOKSTATUS.EXTENDING
		hookedEntity = noone
		
		sprite_index = spr_playerHook
		image_index = CARDINAL_DIR
		image_speed = 0
	}
	
	// フックの伸縮
	var _speedHookTemp = PLAYER_HOOKSPEED
	if (hookStatus != HOOKSTATUS.EXTENDING)
	{
		// フックを縮める状態の場合は速度の符号を反転させる
		_speedHookTemp *= -1
	}
	hook += _speedHookTemp
	switch (image_index)
	{
		case 0:
		{
			hookX = hook
			break
		}
		case 1:
		{
			hookY = -hook
			break
		}
		case 2:
		{
			hookX = -hook
			break
		}
		case 3:
		{
			hookY = hook
			break
		}
	}
	
	// フックの状態に応じた処理
	switch (hookStatus)
	{
		// 伸ばし中の場合
		case HOOKSTATUS.EXTENDING:
		{
			// 一定距離伸びたら、伸び終了
			if (hook >= PLAYER_HOOKDISTANCE)
			{
				hookStatus = HOOKSTATUS.MISSED
			}
			
			// フックに何か当たったか確認
			var _hookHit = collision_circle(x + hookX, y + hookY, 4, obj_parentEntity, false, true)
			if ((_hookHit != noone) && (global.iLifted != _hookHit))
			{
				// フックに何か当たった場合、当たったオブジェクトに応じた処理を行う
				switch (_hookHit.ENTITY_HOOKABLE)
				{
					// プレイヤー側に引き寄せるオブジェクトの場合
					case 1:
					{
						hookStatus = HOOKSTATUS.PULLTOPLAYER
						hookedEntity = _hookHit
						break
					}
					// プレイヤーをオブジェクト側に引き寄せるオブジェクトの場合
					case 2:
					{
						hookStatus = HOOKSTATUS.PULLTOENTITY
						hookedEntity = _hookHit
						break
					}
					// それ以外の場合は、敵ならダメージを与え、ENTITY_HIT_SCRIPTが登録されていればそれを実行する
					default:
					{
						if (object_is_ancestor(_hookHit.object_index, obj_parentEnemy))
						{
							HurtEnemy(_hookHit, 1, id, 5)
							hookStatus = HOOKSTATUS.MISSED
						}
						else
						{
							if (_hookHit.ENTITY_HIT_SCRIPT != -1)
							{
								with (_hookHit)
								{
									script_execute(ENTITY_HIT_SCRIPT)
								}
								hookStatus = HOOKSTATUS.MISSED
							}
						}
						break
					}
				}
			}
			break
		}
		// プレイヤー側に引き寄せる
		case HOOKSTATUS.PULLTOPLAYER:
		{
			with (hookedEntity)
			{
				x = other.x + other.hookX
				y = other.y + other.hookY
			}
			break
		}
		// プレイヤーがオブジェクト側に引き寄せられる
		case HOOKSTATUS.PULLTOENTITY:
		{
			switch (image_index)
			{
				case 0:
				{
					x += PLAYER_HOOKSPEED
					break
				}
				case 1:
				{
					y -= PLAYER_HOOKSPEED
					break
				}
				case 2:
				{
					x -= PLAYER_HOOKSPEED
					break
				}
				case 3:
				{
					y += PLAYER_HOOKSPEED
					break
				}
			}
			break
		}
	}
	
	// フック状態を終了するかどうか
	if (hook <= 0)
	{
		hookedEntity = noone
		state = PlayerStateFree
	}
}