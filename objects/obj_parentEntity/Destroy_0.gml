if (ENTITY_FRAGMENT_COUNT > 0)
{
	fragmentArray = array_create(ENTITY_FRAGMENT_COUNT, ENTITY_FRAGMENT)
	DropItems(x, y, fragmentArray)
}

if (entityDropList != -1)
{
	DropItems(x, y, entityDropList)
}