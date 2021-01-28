// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAnimateSprite(){
	// 今向いている方向
	var _cardinalDirection = CARDINAL_DIR
	// spriteのアニメーションとして使用する画像の枚数
	var _totalFrames = sprite_get_number(sprite_index) / 4
	// 表示する画像のindexを設定する
	image_index = localFrame + (_cardinalDirection * _totalFrames)
	localFrame += sprite_get_speed(sprite_index) / room_speed / 4
	
	// 最後の画像まで行ったら最初に戻る
	if (localFrame >= _totalFrames)
	{
		animationEnd = true
		localFrame -= _totalFrames
	}
	else
	{
		animationEnd = false	
	}
}