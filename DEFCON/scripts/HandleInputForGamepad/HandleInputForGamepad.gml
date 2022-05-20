function HandleInputForGamepad(_movementBehavior) {

	gamepadAxisLV = gamepad_axis_value(global.currentGamepadDevice, gp_axislv);
	gamepadAxisLH = gamepad_axis_value(global.currentGamepadDevice, gp_axislh);
	var _gamepadLeftStickDirectionLeft = gamepadAxisLH <= -0.70;
	var _gamepadLeftStickDirectionRight = gamepadAxisLH >= 0.70;
	var _gamepadLeftStickDirectionUp = gamepadAxisLV <= -0.70;
	var _gamepadLeftStickDirectionDown = gamepadAxisLV >= 0.70;
	var _gamepadLeftStickDirectionLeftResetNeutral = gamepadAxisLH > -0.30;
	var _gamepadLeftStickDirectionRightResetNeutral = gamepadAxisLH < 0.30;
	var _gamepadLeftStickDirectionUpResetNeutral = gamepadAxisLV > -0.30;
	var _gamepadLeftStickDirectionDownResetNeutral = gamepadAxisLV < 0.30;

	//Button presses always need to be available
	inputKeyButtonA = inputKeyButtonA || gamepad_button_check_pressed(global.currentGamepadDevice, gp_face1);
	inputKeyButtonB = inputKeyButtonB || gamepad_button_check_pressed(global.currentGamepadDevice, gp_face2);
	if (allowContinualMashInputKeyButtonB) {
		//Used to simulate continual B presses, like mashing through text
		inputKeyButtonB = inputKeyButtonB || gamepad_button_check(global.currentGamepadDevice, gp_face2);
	}
	inputKeyButtonX = inputKeyButtonX || gamepad_button_check_pressed(global.currentGamepadDevice, gp_face3);
	inputKeyButtonY = inputKeyButtonY || gamepad_button_check_pressed(global.currentGamepadDevice, gp_face4);
	inputKeyButtonSelect = inputKeyButtonSelect || gamepad_button_check_pressed(global.currentGamepadDevice, gp_select);
	inputKeyButtonStart = inputKeyButtonStart || gamepad_button_check_pressed(global.currentGamepadDevice, gp_start);

	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_CONTINUALLY) {
		//Player Input for walking
		inputKeyDirectionLeft = inputKeyDirectionLeft || gamepad_button_check(global.currentGamepadDevice, gp_padl) || _gamepadLeftStickDirectionLeft;
		inputKeyDirectionRight = inputKeyDirectionRight || gamepad_button_check(global.currentGamepadDevice, gp_padr) || _gamepadLeftStickDirectionRight;
		inputKeyDirectionUp = inputKeyDirectionUp || gamepad_button_check(global.currentGamepadDevice, gp_padu) || _gamepadLeftStickDirectionUp;
		inputKeyDirectionDown = inputKeyDirectionDown || gamepad_button_check(global.currentGamepadDevice, gp_padd) || _gamepadLeftStickDirectionDown;
	}
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_ON_PRESSED) {
		inputKeyDirectionLeft = inputKeyDirectionLeft || gamepad_button_check_pressed(global.currentGamepadDevice, gp_padl)
		inputKeyDirectionRight = inputKeyDirectionRight || gamepad_button_check_pressed(global.currentGamepadDevice, gp_padr)
		inputKeyDirectionUp = inputKeyDirectionUp || gamepad_button_check_pressed(global.currentGamepadDevice, gp_padu)
		inputKeyDirectionDown = inputKeyDirectionDown || gamepad_button_check_pressed(global.currentGamepadDevice, gp_padd)
		MimicDPadOnLeftStick(
							_movementBehavior,
							_gamepadLeftStickDirectionLeft,
							_gamepadLeftStickDirectionRight,
							_gamepadLeftStickDirectionUp,
							_gamepadLeftStickDirectionDown,
							_gamepadLeftStickDirectionLeftResetNeutral,
							_gamepadLeftStickDirectionRightResetNeutral,
							_gamepadLeftStickDirectionUpResetNeutral,
							_gamepadLeftStickDirectionDownResetNeutral
							);
	}
	if (_movementBehavior == MOVEMENT_BEHAVIOR.CHECK_ON_PRESSED_HORIZONTAL) {
		inputKeyDirectionLeft = inputKeyDirectionLeft || gamepad_button_check_pressed(global.currentGamepadDevice, gp_padl)
		inputKeyDirectionRight = inputKeyDirectionRight || gamepad_button_check_pressed(global.currentGamepadDevice, gp_padr)
		MimicDPadOnLeftStick(
							_movementBehavior,
							_gamepadLeftStickDirectionLeft,
							_gamepadLeftStickDirectionRight,
							0,
							0,
							_gamepadLeftStickDirectionLeftResetNeutral,
							_gamepadLeftStickDirectionRightResetNeutral,
							0,
							0
							);
	}
}
