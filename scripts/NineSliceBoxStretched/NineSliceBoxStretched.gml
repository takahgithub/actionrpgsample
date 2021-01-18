/// @desc NineSliceBoxStretched(sprite, x1, y1, x2, y2, image_index)
/// @arg sprite
/// @arg x1 left
/// @arg y1 top
/// @arg x2 right
/// @arg y2 bottom
/// @arg image_index image index
function NineSliceBoxStretched(_sprite, _x1, _y1, _x2, _y2, _image_index){
	var _size = sprite_get_width(_sprite) / 3
	var _w = _x2 - _x1
	var _h = _y2 - _y1
	
	// 真ん中部分の表示
	draw_sprite_part_ext(_sprite, _image_index, _size, _size, 1, 1, _x1+_size, _y1+_size, _w-(_size*2), _h-(_size*2), c_white, 1)
	
	// 4つの角の表示
	// 左上
	draw_sprite_part(_sprite, _image_index, 0, 0, _size, _size, _x1, _y1)
	// 右上
	draw_sprite_part(_sprite, _image_index, _size*2, 0, _size, _size, _x1+_w-_size, _y1)
	// 左下
	draw_sprite_part(_sprite, _image_index, 0, _size*2, _size, _size, _x1, _y1+_h-_size)
	// 右下
	draw_sprite_part(_sprite, _image_index, _size*2, _size*2, _size, _size, _x1+_w-_size, _y1+_h-_size)
	
	// ４つの辺
	// 左
	draw_sprite_part_ext(_sprite, _image_index, 0, _size, _size, 1, _x1, _y1+_size, 1, _h-(_size*2), c_white, 1)
	// 右
	draw_sprite_part_ext(_sprite, _image_index, _size*2, _size, _size, 1, _x1+_w-_size, _y1+_size, 1, _h-(_size*2), c_white, 1)
	// 上
	draw_sprite_part_ext(_sprite, _image_index, _size, 0, 1, _size, _x1+_size, _y1, _w-(_size*2), 1, c_white, 1)
	// 下
	draw_sprite_part_ext(_sprite, _image_index, _size, _size*2, 1, _size, _x1+_size, _y1+_h-(_size), _w-(_size*2), 1, c_white, 1)
}