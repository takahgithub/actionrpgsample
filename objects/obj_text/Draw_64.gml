// テキストボックスの枠を表示
NineSliceBoxStretched(spr_textBoxBg, x1, y1, x2, y2, background)

draw_set_font(f_text)
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_color(c_black)

var _printMessage = string_copy(drawMessage, 1, textProgress)

if ((responses[0] != -1) && (textProgress >= string_length(drawMessage)))
{
	for (var i = 0; i < array_length(responses); i++)
	{
		_printMessage += "\n"
		if (i == responseSelected)
		{
			_printMessage += "> "
		}
		_printMessage += responses[i]
		if (i == responseSelected)
		{
			_printMessage += " <"
		}
	}
}

draw_text((x1+x2)/2, y1+8, _printMessage)

// メッセージを強調するため、少しずらして白色のメッセージを表示する
draw_set_color(c_white)
draw_text((x1+x2)/2, y1+7, _printMessage)