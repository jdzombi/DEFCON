function HandleInputForKeyboard(_movementBehavior) {

	//Button presses always need to be available
	inputKeyButtonA = keyboard_check_pressed(ord("Z"));
	inputKeyButtonB = keyboard_check_pressed(ord("X"));
	if (allowContinualMashInputKeyButtonB) {
		//Used to simulate continual B presses, like mashing through text
		inputKeyButtonB = keyboard_check(ord("X"));
	}
	inputKeyButtonX = keyboard_check_pressed(ord("V"));
	inputKeyButtonY = keyboard_check_pressed(ord("C"));
	inputKeyButtonSelect = keyboard_check_pressed(vk_tab);
	inputKeyButtonStart = keyboard_check_pressed(vk_escape);
	
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_CONTINUALLY) {
		//Player Input for walking
		inputKeyDirectionLeft = keyboard_check(ord("A"));
		inputKeyDirectionRight = keyboard_check(ord("D"));
		inputKeyDirectionUp = keyboard_check(ord("W"));
		inputKeyDirectionDown = keyboard_check(ord("S"));
	}
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_ON_PRESSED) {
		inputKeyDirectionLeft = keyboard_check_pressed(ord("A"));
		inputKeyDirectionRight = keyboard_check_pressed(ord("D"));
		inputKeyDirectionUp = keyboard_check_pressed(ord("W"));
		inputKeyDirectionDown = keyboard_check_pressed(ord("S"));
	}
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_ON_PRESSED_HORIZONTAL) {
		inputKeyDirectionLeft = keyboard_check_pressed(ord("A"));
		inputKeyDirectionRight = keyboard_check_pressed(ord("D"));
	}
}
