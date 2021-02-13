function DropItems(_x, _y, _itemList){
	var _items = array_length(_itemList)
	if (_items > 1)
	{
		var _anglePerItem = 360 / _items
		var _angle = random(360)
		for (var i = 0; i < _items; i++)
		{
			with (instance_create_layer(_x, _y, "Instances", _itemList[i]))
			{
				direction = _angle
				spd = 0.75 + (_items * 0.1) + random(0.1)
			}
			_angle += _anglePerItem
		}
	}
	else
	{
		instance_create_layer(_x, _y, "Instances", _itemList[0])
	}
}