function AttackSlash(){
	if (sprite_index != spr_playerAttackSlash)
	{
		sprite_index = spr_playerAttackSlash
		localFrame = 0
		image_index = 0
		
		if (!ds_exists(hitByAttack, ds_type_list))
		{
			hitByAttack = ds_list_create()
		}
		ds_list_clear(hitByAttack)
	}
	
	CalcAttack(spr_playerAttackSlashHB)
	
	PlayerAnimateSprite()
	
	if (animationEnd)
	{
		state = PlayerStateFree
		animationEnd = false
	}
}