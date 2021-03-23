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
					if (object_is_ancestor(object_index, obj_parentEnemy))
					{
						HurtEnemy(id, 5, other.id, 10)
					}
					else if (ENTITY_HIT_SCRIPT != -1)
					{
						script_execute(ENTITY_HIT_SCRIPT)
					}
				}
			}
		}
	}
	
	ds_list_destroy(_hitByAttackNow)
	mask_index = spr_player
}