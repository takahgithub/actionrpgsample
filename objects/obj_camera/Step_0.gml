// カメラの位置の目的地を設定する
if (instance_exists(follow))
{
	xTo = follow.x
	yTo = follow.y
}

// カメラの位置を目的地に向かって少しずつ動かす
x += (xTo - x) / 15
y += (yTo - y) / 15

// カメラの位置はroom外に行かないように
x = clamp(x, viewWidthHalf, room_width - viewWidthHalf)
y = clamp(y, viewHeightHalf, room_height - viewHeightHalf)

// 画面を揺らす
x += random_range(-shakeRemain, shakeRemain)
y += random_range(-shakeRemain, shakeRemain)

shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude))

camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf)