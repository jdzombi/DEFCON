if (x > xMax || x < xMin || y > yMax || y < yMin){
	instance_destroy();
}

if (TileMeetingPrecise(x, y, collisionMap)) {
		instance_destroy();
	}
	
