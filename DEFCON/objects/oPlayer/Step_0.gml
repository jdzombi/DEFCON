event_inherited()

inputDirection = point_direction(0, 0, inputKeyDirectionRight - inputKeyDirectionLeft, inputKeyDirectionDown - inputKeyDirectionUp);
inputMagnitude = (inputKeyDirectionRight - inputKeyDirectionLeft != 0) || (inputKeyDirectionDown - inputKeyDirectionUp != 0);

if !(global.gamePaused) { script_execute(state); }

depth = -bbox_bottom;

mouseAngle = point_direction(x, y, mouse_x, mouse_y);

shootCD--;
if (mouse_check_button(mb_left) && shootCD <= 0){
	shootCD = shootCDMax;
	//TODO Fix Spawn location
	with (instance_create_layer(x, y-15, "bullets", oBullet)){
		//direction = point_direction(x, y, mouse_x, mouse_y); //wanted to use mouseAngle here but it got finnicky
		dir = round(oPlayer.mouseAngle/45)*45;
		spd = 2;
	}
}

if (mouse_check_button(mb_right) && meleeCD <= 0){
	meleeCD = meleeCDMax;
	//create hitbox
}
