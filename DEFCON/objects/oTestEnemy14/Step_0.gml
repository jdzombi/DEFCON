p_distance = distance_to_object(oPlayer);

script_execute(state);

	if (TileMeetingPrecise(x + hspd, y, collisionMap)) {
			hspd = 0;
		}
	
	if (TileMeetingPrecise(x, y+vspd, collisionMap)) {
			vspd = 0;
			
		}
		

AnimateNPC(1);

x+= hspd;
y+= vspd;