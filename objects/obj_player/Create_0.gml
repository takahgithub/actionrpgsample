state = PlayerStateFree
stateAttack = AttackSlash
hitByAttack = -1
lastState = state

collisionMap = layer_tilemap_get_id(layer_get_id("Tiles_Col"))

image_index = 0
image_speed = 0

hSpeed = 0
vSpeed = 0

z = 0

spriteRoll = spr_playerRoll
spriteRun = spr_playerRun
spriteIdle = spr_player
spriteBonk = spr_playerHurt
localFrame = 0