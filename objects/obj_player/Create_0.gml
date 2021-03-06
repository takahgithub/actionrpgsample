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
invulnerable = 0
flash = 0
flashShader = sh_whiteFlash

animationEndScript = -1
animationEndScriptArgs = []

hook = 0
hookX = 0
hookY = 0
hookSize = sprite_get_width(spr_hookChain)

if (global.iLifted != noone)
{
	spriteIdle = spr_playerCarrying
	spriteRun = spr_playerRunCarrying
}
else
{
	spriteIdle = spr_player
	spriteRun = spr_playerRun
}
sprite_index = spriteIdle

spriteRoll = spr_playerRoll
//spriteRun = spr_playerRun
//spriteIdle = spr_player
spriteBonk = spr_playerHurt
localFrame = 0

if (global.targetX != -1)
{
	x = global.targetX
	y = global.targetY
	direction = global.targetDirection
}