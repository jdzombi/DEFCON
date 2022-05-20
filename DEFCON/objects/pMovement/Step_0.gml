var i;
var _gamepadNumber = gamepad_get_device_count();
for (i = 0; i < _gamepadNumber; i++;) {
	if (gamepad_is_connected(i)) {
		global.currentGamepadDevice = i;
		isGamepadConnected = gamepad_is_connected(i);
	}
}

if (instance_exists(currentObj)) {
	HandleInputForKeyboard(movementBehavior);
	if (isGamepadConnected) {
		HandleInputForGamepad(movementBehavior);
	}
}
