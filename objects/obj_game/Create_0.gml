randomize()
global.textSpeed = TEXT_SPEED
global.gamePaused = false
global.iCamera = instance_create_layer(0, 0, layer, obj_camera)

// ↓これいる？
// surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H)
room_goto(ROOM_START)
