/// @description Initialize & Globals

//Function that initializes static variables (These don't change)
InitPrincipalGlobals();

// Globals
#macro PAUSED_TIME		global.__PausedTime			// If the game is paused or not
#macro PAUSED		global.__Paused					// If the game is paused or not
#macro PLAYER		global.__Player					// ID of the player
#macro CAMERA		global.iCamera					// ID of the camera

PAUSED_TIME = get_timer();
PAUSED = false;
PLAYER = noone;

//0 - Gun ID
//1 - Gun type Enum
//2 - Damage
//3 - Mag Size Mag
//4 - Ammo Reserve Default
//5 - Ammo Reserve Max
gunArray = [
	[0,GUN_TYPE.PISTOL,2,8,32,128]

];

//Player Gun 1 ID
//Player Gun 1 Mag Remaining
//Player Gun 1 Reserve Remaining
//Player Gun 2 ID
//Player Gun 2 Mag Remaining
//Player Gun 2 Reserve Remaining
playerCurrentLoadout = [
	[0,8,32], //TODO update accordingly to appropriate gun
	[-1,-1,-1]

];

//networking
is_multiplayer = false;
server_ip = "10.220.80.195";
server_port = 3000;
is_server = false;
//connected clients
clients = ds_list_create();
