//Global shortcuts
function MACRO(){
#macro FRAME_RATE 60
#macro TILE_SIZE 8
#macro CARDINAL_DIR round(direction/45)
#macro ROOM_START rTest
#macro RESOLUTION_W 256
#macro RESOLUTION_H 144
#macro SCALE_SIZE 4

#macro TRANSITION_SPEED 0.04
#macro OUT 0
#macro IN 1


#macro MAX_LLONG 9223372036854775807		// 2^63 - 1
#macro MAX_INT 2147483647					// 2^31 - 1

#macro CONSTRUCTOR_EVENT event_user(14)	// User defined event for declaring methods in objects
#macro METHOD_EVENT event_user(15)		// User defined event for declaring methods in objects

enum ATTACK_TYPE {
	MELEE, RANGED
}

enum ANCHOR {
	TOP_LEFT    = 7, TOP_CENTER    = 8, TOP_RIGHT    = 9,
	MIDDLE_LEFT = 4, MIDDLE_CENTER = 5, MIDDLE_RIGHT = 6,
	BOTTOM_LEFT = 1, BOTTOM_CENTER = 2, BOTTOM_RIGHT = 3,
}

}