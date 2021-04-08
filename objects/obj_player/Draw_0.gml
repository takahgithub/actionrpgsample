draw_sprite(spr_shadow, 0, floor(x), floor(y))

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