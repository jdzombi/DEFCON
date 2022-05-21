if (distance_to_object(oPlayer)>100){
	instance_destroy();
}

if (TileMeetingPrecise(x, y, collisionMap)) {
		instance_destroy();
	}
	
