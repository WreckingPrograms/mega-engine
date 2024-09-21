enum Directions
{
	RIGHT = 0,
	UP = 90,
	LEFT = 180,
	DOWN = 270
}

enum Weapons
{
	MEGA_BUSTER,
	SILVER_TOMAHAWK,
	WIND_STORM,
	PHARAOH_SHOT,
	METAL_BLADE,
	RUSH_COIL,
	STAR_CRASH,
	RUSH_JET,
	
	COUNT
}

enum WeaponPierceTypes
{
	NO_PIERCE,
	OVERKILL_PIERCE, // Only pierce if the attack deals more damage than the enemy's HP
	SOFT_PIERCE, // Only pierce if the attack kills the enemy
	PIECE
}