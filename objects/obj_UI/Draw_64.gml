var _playerHealth = global.playerHealth
var _playerHealthMax = global.playerHealthMax
// HPの小数部分
var _playerHealthFrac = frac(_playerHealth)
// _playerHealthはHPの整数部分になる
_playerHealth -= _playerHealthFrac

for (var i = 1; i <= _playerHealthMax; i++)
{
	var _imageIndex = (i > _playerHealth)
	if (i == (_playerHealth + 1))
	{
		_imageIndex += (_playerHealthFrac > 0)
		_imageIndex += (_playerHealthFrac > 0.25)
		_imageIndex += (_playerHealthFrac > 0.5)
	}
	draw_sprite(spr_health, _imageIndex, 8 + ((i - 1) * 24), 8)
}