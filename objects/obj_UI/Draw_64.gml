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