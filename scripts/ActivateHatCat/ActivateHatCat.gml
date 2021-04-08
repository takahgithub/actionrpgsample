function ActivateHatCat(){
	// hatを持っているかどうか
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == obj_hat)
	
	// 現在のTheHatQuestの状態に応じて何をするか変わる
	switch (global.questStatus[? "TheHatQuest"])
	{
		// クエスト未受注の時
		case 0:
			{
				if (_hasHat)
				{
					// 既に帽子を持っていれば即クエスト完了
					NewTextBox("Wow, you found my hat without me even asking you to!", 0)
					NewTextBox("You are a true hero indeed!", 0)
					global.questStatus[? "TheHatQuest"] = 2
					with (obj_questNPC)
					{
						sprite_index = spr_questNPCHat
					}
					with (obj_hat)
					{
						instance_destroy()
					}
					global.iLifted = noone
					with (obj_player)
					{
						spriteIdle = spr_player
						spriteRun = spr_playerRun
					}
				}
				else
				{
					// 帽子を持っていない場合はクエストを受注するかどうか選択するダイアログを表示
					NewTextBox("Hello there! You look like a brave adventurer!\nWhat with the cape and all.", 0)
					NewTextBox("Could you help me find my missing hat?", 0,
					["4:Of course!", "5:This task is beneath me"])
				}
			}
			break
		// クエスト受注中
		case 1:
			{
				if (_hasHat)
				{
					// 帽子を持っていればクエスト完了
					NewTextBox("Wow, you found my hat!", 0)
					NewTextBox("You are a true hero indeed!", 0)
					global.questStatus[? "TheHatQuest"] = 2
					with (obj_questNPC)
					{
						sprite_index = spr_questNPCHat
					}
					with (obj_hat)
					{
						instance_destroy()
					}
					global.iLifted = noone
					with (obj_player)
					{
						spriteIdle = spr_player
						spriteRun = spr_playerRun
					}
				}
				else
				{
					// 帽子を持っていなければ会話するのみ
					NewTextBox("I think I left my hat in that\nscary cave to the north east.", 0)
					NewTextBox("You might need some items to get there!", 0)
				}
			}
			break
		// クエスト完了後。会話のみ
		case 2:
			{
				NewTextBox("Thanks again!", 0)
			}
			break
		default:
			break
	}
}