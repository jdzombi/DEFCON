pCol = place_meeting(x, y, oPlayer);

if (pCol || (collision_point( mouse_x, mouse_y, id, true, false ) && keyboard_check(ord("E"))&& distance_to_object(oPlayer)<15)) {
	//TODO: Decide how much ammo is added later
	addAmmo(8);
	//TODO: Make ammo boxes not disappear if you are full on ammo
	instance_destroy();	
}

HoverObject(.1,.1);


