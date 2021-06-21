function UseItemBow(){
	if ((global.playerAmmo[ITEM.BOW] > 0) && (global.iLifted == noone))
	{
		global.playerAmmo[ITEM.BOW]--
		PlayerActOutAnimation(spr_playerBow, PlayerFireArrow)
	}
}