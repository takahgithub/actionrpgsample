randomize()
global.textSpeed = TEXT_SPEED
global.gamePaused = false
global.targetRoom = -1
global.targetX = -1
global.targetY = -1
global.targetDirection = 0
global.iLifted = noone
global.playerHealthMax = 5
global.playerHealth = global.playerHealthMax
global.questStatus = ds_map_create()
global.questStatus[? "TheHatQuest"] = 0

global.iCamera = instance_create_layer(0, 0, layer, obj_camera)
global.iUI = instance_create_layer(0, 0, layer, obj_UI)

// ↓これいる？
// surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START)
