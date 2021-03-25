function ActivateHatCat(){
	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == obj_hat)
	switch (global.questStatus[? "TheHatQuest"])
	{
		case 0:
		{
			if (_hasHat)
			{
				NewTextBox("Wow, you found my hat without me even asking you to!", 0)
				NewTextBox("You are a true hero indeed!", 0)
				global.questStatus[? "TheHatQuest"] = 2
				with (obj_questNPC)
				{
					sprite_index = spr_questieHat
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
				NewTextBox("Hello there! You look like a brave adventurer!\nWhat with the cape and all.", 0)
				NewTextBox("Could you help me find my missing hat?", 0,
				["4:Of course!", "5:This task is beneath me"])
			}
		}
		break
		case 1:
		{
			if (_hasHat)
			{
				NewTextBox("Wow, you found my hat!", 0)
				NewTextBox("You are a true hero indeed!", 0)
				global.questStatus[? "TheHatQuest"] = 2
				with (obj_questNPC)
				{
					sprite_index = spr_questieHat
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
				NewTextBox("I think I left my hat in that\nscary cave to the north east.", 0)
				NewTextBox("You might need some items to get there!", 0)
			}
		}
		break
		case 2:
		{
			NewTextBox("Thanks again!", 0)
		}
		break
	}
}