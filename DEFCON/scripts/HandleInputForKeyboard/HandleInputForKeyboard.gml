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
		inputKeyDirectionLeft = keyboard_check(vk_left);
		inputKeyDirectionRight = keyboard_check(vk_right);
		inputKeyDirectionUp = keyboard_check(vk_up);
		inputKeyDirectionDown = keyboard_check(vk_down);
	}
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_ON_PRESSED) {
		inputKeyDirectionLeft = keyboard_check_pressed(vk_left);
		inputKeyDirectionRight = keyboard_check_pressed(vk_right);
		inputKeyDirectionUp = keyboard_check_pressed(vk_up);
		inputKeyDirectionDown = keyboard_check_pressed(vk_down);
	}
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_ON_PRESSED_HORIZONTAL) {
		inputKeyDirectionLeft = keyboard_check_pressed(vk_left);
		inputKeyDirectionRight = keyboard_check_pressed(vk_right);
	}
}
