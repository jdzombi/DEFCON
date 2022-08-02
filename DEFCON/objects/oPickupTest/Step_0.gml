pCol = place_meeting(x, y, oPlayer);

if (pCol || pickUp()) {
	//TODO: Decide how much ammo is added later
	addAmmo(8);
	//TODO: Make ammo boxes not disappear if you are full on ammo
	instance_destroy();	
}

HoverObject(.1,.1);


