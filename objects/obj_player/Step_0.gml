var _keyUp = keyboard_check(vk_up) || keyboard_check(ord("W"))
var _keyDown = keyboard_check(vk_down) || keyboard_check(ord("S"))
var _keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
var _keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"))

var vx = 0
var vy = 0

// 右移動が+1, 左移動が-1
vx = _keyRight - _keyLeft
// 上移動が-1, 下移動が+1
vy = _keyDown - _keyUp

// 移動方向
inputDirection = point_direction(0, 0, vx, vy)
// 移動するかどうか。移動するなら1、しないなら0になる
inputMagnitude = (vx != 0) || (vy != 0)

hspeed = lengthdir_x(inputMagnitude * PLAYER_MOVESPEED, inputDirection)
vspeed = lengthdir_y(inputMagnitude * PLAYER_MOVESPEED, inputDirection)


PlayerCollision()

// ここにSprite、image_index更新の処理
