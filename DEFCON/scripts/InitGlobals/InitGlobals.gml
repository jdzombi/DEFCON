//Initialized variables 
function InitPrincipalGlobals(){
	
	InitEnumGlobals();
	
	global.gamePaused = false;
	global.textSpeed = 0.75;
	global.targetRoom = -1;
	global.targetX = -1;
	global.targetY = -1;
	global.targetDirection = 0;
	
	
	global.iCamera = instance_create_layer(x, y, layer, oCamera);
	display_set_gui_size(RESOLUTION_W,RESOLUTION_H);
	room_goto(ROOM_START);
}

//Initialize Enumerators
function InitEnumGlobals() {

	enum TRANS_TYPE {
		SLIDE,
		FADE,
		COUNT
	}

	enum EXIT_TYPE {
		SCREEN_EDGE,
		OPEN_DOORWAY,
		CLOSED_DOOR,
		COUNT
	}

	enum CARDINAL_DIRECTION {
		RIGHT = 0,
		UP = 90,
		LEFT = 180,
		DOWN = 270,
		COUNT
	}

	enum MOVEMENT_BEHAVIOR {
		CHECK_CONTINUALLY,
		CHECK_ON_PRESSED,
		CHECK_ON_PRESSED_HORIZONTAL,
		CHECK_ON_RELEASED,
		COUNT
	}

}
