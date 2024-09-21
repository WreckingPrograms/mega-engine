// Consume weapon ammo
function playerConsumeAmmo(weaponIndex, forceAmount=undefined)
{
	global.ammo[weaponIndex] -= forceAmount ?? global.weaponAmmo[global.weaponSlot[weaponIndex]];
	if global.ammo[weaponIndex] <= 0
	    global.ammo[weaponIndex] = 0;
}