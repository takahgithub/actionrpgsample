// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false
	var _entityList = ds_list_create()
	
	// マップのタイルとの衝突
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE
		if (sign(hSpeed) == 1)
		{
			x += TILE_SIZE - 1
		}
		hSpeed = 0
		_collision = true
	}
	
	// エンティティとの衝突
	
	// 移動後衝突するエンティティの数
	var _entityCount = instance_position_list(x + hSpeed, y, obj_parentEntity, _entityList, false)
	// 衝突時のプレイヤーの移動先。エンティティに隣接するように設定する
	var _snapX
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0]
		// もし衝突判定対象のエンティティであれば、プレイヤーを隣接するように移動させる
		if (_entityCheck.ENTITY_COLLISION)
		{
			if (sign(hSpeed) == -1)
			{
				_snapX = _entityCheck.bbox_right + 1
			}
			else
			{
				_snapX = _entityCheck.bbox_left - 1
			}
			x = _snapX
			hSpeed = 0
			_collision = true
			_entityCount = 0
		}
		ds_list_delete(_entityList, 0)
		_entityCount--
	}
	
	x += hSpeed
	
	ds_list_clear(_entityList)
	
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE
		if (sign(vSpeed) == 1)
		{
			y += TILE_SIZE - 1
		}
		vSpeed = 0
		_collision = true
	}
	
	// エンティティとの衝突
	
	// 移動後衝突するエンティティの数
	var _entityCount = instance_position_list(x, y + vSpeed, obj_parentEntity, _entityList, false)
	// 衝突時のプレイヤーの移動先。エンティティに隣接するように設定する
	var _snapY
	while (_entityCount > 0)
	{
		var _entityCheck = _entityList[| 0]
		// もし衝突判定対象のエンティティであれば、プレイヤーを隣接するように移動させる
		if (_entityCheck.ENTITY_COLLISION)
		{
			if (sign(vSpeed) == -1)
			{
				_snapY = _entityCheck.bbox_bottom + 1
			}
			else
			{
				_snapY = _entityCheck.bbox_top - 1
			}
			y = _snapY
			vSpeed = 0
			_collision = true
			_entityCount = 0
		}
		ds_list_delete(_entityList, 0)
		_entityCount--
	}
	
	y += vSpeed
	
	ds_list_destroy(_entityList)
	
	return _collision
}