if (pickUp()) {
	instance_create(x+random_range(-30,25),y+16+random_range(-8,8),oPickupTest);
}

if (distance_to_object(oPlayer) < 20) {
	showText = true;
} else {
	showText = false;
}

costString = " Ammo Cost: " + string(cost);