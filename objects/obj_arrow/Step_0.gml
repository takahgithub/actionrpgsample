var _entity = instance_place(x, y, obj_parentEntity)
var _break = false
if (_entity != noone)
{
	with (_entity)
	{
		if (object_is_ancestor(object_index, obj_parentEnemy))
		{
			HurtEnemy(id, 25, other.id, 20)
			_break = true
		}
		else
		{
			if (ENTITY_HIT_SCRIPT != -1)
			{
				script_execute(ENTITY_HIT_SCRIPT)
				_break = true
			}
		}
	}
	
	if (_break)
	{
		instance_destroy()
	}
}

// カメラの範囲外に出たらオブジェクトを消す
var _cam = view_camera[0]
var _camX = camera_get_view_x(_cam)
var _camY = camera_get_view_y(_cam)
var _camWidth = camera_get_view_width(_cam)
var _camHeight = camera_get_view_height(_cam)
if (!point_in_rectangle(x, y, _camX, _camY, _camX + _camWidth, _camY + _camHeight))
{
	instance_destroy()
}