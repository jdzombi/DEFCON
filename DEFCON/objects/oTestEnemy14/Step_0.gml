p_distance = distance_to_object(oPlayer);

if (p_distance > 5){
	state = MoveTowardsPlayer();
} else {
	hspd = 0;
	vspd = 0;
	//attack state
}




//script_execute(state);

	if (TileMeetingPrecise(x + hspd, y, collisionMap)) {
			hspd = 0;
		}
	
	if (TileMeetingPrecise(x, y+vspd, collisionMap)) {
			vspd = 0;
			
		}

x+= hspd;
y+= vspd;