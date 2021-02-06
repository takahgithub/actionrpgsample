function CalcAttack(_hbSprite){
	mask_index = _hbSprite
	var _hitByAttackNow = ds_list_create()
	var _hits = instance_place_list(x, y, obj_parentEntity, _hitByAttackNow, false)
	if (_hits > 0)
	{
		for (var i = 0; i < _hits; i++)
		{
			var _hitId = _hitByAttackNow[| i]
			if (ds_list_find_index(hitByAttack, _hitId) == -1)
			{
				ds_list_add(hitByAttack, _hitId)
				with (_hitId)
				{
					image_blend = c_red
				}
			}
		}
	}
	
	ds_list_destroy(_hitByAttackNow)
	mask_index = spr_player
}