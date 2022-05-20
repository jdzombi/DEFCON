event_inherited()

inputDirection = point_direction(0, 0, inputKeyDirectionRight - inputKeyDirectionLeft, inputKeyDirectionDown - inputKeyDirectionUp);
inputMagnitude = (inputKeyDirectionRight - inputKeyDirectionLeft != 0) || (inputKeyDirectionDown - inputKeyDirectionUp != 0);

if !(global.gamePaused) { script_execute(state); }

depth = -bbox_bottom;

mouseAngle = point_direction(x, y, mouse_x, mouse_y);

show_debug_message(mouseAngle);

