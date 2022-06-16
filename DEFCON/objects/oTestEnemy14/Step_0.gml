p_distance = distance_to_object(oPlayer);

if (p_distance > 5){
	state = MoveTowardsPlayer();
	sprite_index = sWalk;
} else {
	hspd = 0;
	vspd = 0;
	state = Attack();
	sprite_index = sAttack;
}




//script_execute(state);

	if (TileMeetingPrecise(x + hspd, y, collisionMap)) {
			hspd = 0;
		}
	
	if (TileMeetingPrecise(x, y+vspd, collisionMap)) {
			vspd = 0;
			
		}
		
AnimateNPC(1);

x+= hspd;
y+= vspd;