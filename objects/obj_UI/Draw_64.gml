// HPの表示

var _playerHealth = global.playerHealth
var _playerHealthMax = global.playerHealthMax
// HPの小数部分
var _playerHealthFrac = frac(_playerHealth)
// _playerHealthはHPの整数部分になる
_playerHealth -= _playerHealthFrac

for (var i = 1; i <= _playerHealthMax; i++)
{
	// 現在のHP = 3.5　→ _playerHealth = 3, _playerHealthFrac = 0.5
	// i = 1 _imageIndex = 0
	// i = 2 _imageIndex = 0
	// i = 3 _imageIndex = 0
	// i = 4 _imageIndex = 3
	// i = 5 _imageIndex = 1
	var _imageIndex = (i > _playerHealth)
	if (i == (_playerHealth + 1))
	{
		_imageIndex += (_playerHealthFrac > 0)
		_imageIndex += (_playerHealthFrac > 0.25)
		_imageIndex += (_playerHealthFrac > 0.5)
	}
	draw_sprite(spr_health, _imageIndex, 8 + ((i - 1) * 24), 8)
}

// コインの表示

var _xx, _yy

// コインのアイコン
_xx = 8
_yy = 45
draw_sprite(spr_coinUI, 0, _xx, _yy)

// 文字
draw_set_color(c_black)
draw_set_font(f_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
_xx += sprite_get_width(spr_coinUI) + 4
_yy = 45
var _str = string(global.playerMoney)
draw_text(_xx+1, _yy, _str)
draw_text(_xx-1, _yy, _str)
draw_text(_xx, _yy+1, _str)
draw_text(_xx, _yy-1, _str)
draw_set_color(c_white)
draw_text(_xx, _yy, _str)