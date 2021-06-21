draw_sprite(spr_shadow, 0, floor(x), floor(y))

// プレイヤーが下向きでない場合、プレイヤーより先に描画する。プレイヤーより上に描画されないようにするため？
if ((state == PlayerStateHook) && (image_index != 3))
{
	DrawHookChain()
}

// invulnerable = 20
// 4, 3, 2, 1, 0, 7, 6, 5, 4, 3, 2, 1, 0, ...
if ((invulnerable != 0) && !((invulnerable mod 8) < 2) && (flash == 0))
{
	// キャラクターの描画をしない
}
else
{
	if (flash != 0)
	{
		shader_set(flashShader)
		uFlash = shader_get_uniform(flashShader, "flash")
		shader_set_uniform_f(uFlash, flash)
	}
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y-z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
	
	if (shader_current() != -1)
	{
		shader_reset()
	}
}

// プレイヤーが下向きの場合、プレイヤーより後に描画する。プレイヤーより上に描画するため？
if ((state == PlayerStateHook) && (image_index == 3))
{
	DrawHookChain()
}


function DrawHookChain()
{
	var _originX = floor(x)
	var _originY = floor(y) - 12
	
	var _chains = hook div hookSize
	var _hookDirX = sign(hookX)
	var _hookDirY = sign(hookY)
	for (var i = 0; i < _chains; i++)
	{
		draw_sprite(
			spr_hookChain,
			0,
			_originX + hookX - (i * hookSize * _hookDirX),
			_originY + hookY - (i * hookSize * _hookDirY)
			)
	}
	
	draw_sprite(spr_hookBlade, image_index, _originX + hookX, _originY + hookY)
}