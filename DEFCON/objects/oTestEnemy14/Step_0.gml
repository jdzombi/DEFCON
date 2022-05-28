if (CheckForPlayer()){
	state = MoveTowardsPlayer();
}




/*script_execute(state);

	if (TileMeetingPrecise(x + hspd, y, collisionMap)) {
			hspd = 0;
		}
	
	if (TileMeetingPrecise(x, y+vspd, collisionMap)) {
			vspd = 0;
			
		}*/

x+= hspd;
y+= vspd;