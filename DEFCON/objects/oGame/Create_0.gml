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



