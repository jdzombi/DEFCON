if (pickUp()) {
	instance_create(x+random_range(-30,25),y+16+random_range(-8,8),oPickupTest);
	var _inst = instance_nearest(x,y,oPlayer);
	_inst.playerScore-=cost;
}

if (distance_to_object(oPlayer) < 20) {
	showText = true;
} else {
	showText = false;
}

costString = " Ammo Cost: " + string(cost);