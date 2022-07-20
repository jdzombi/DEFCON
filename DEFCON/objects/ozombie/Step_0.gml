nearestPlayer = instance_nearest(x, y, oPlayer);

if (target != nearestPlayer && targetCD <= 0){ //get target if another player comes closer than current target
	target = nearestPlayer;
	targetCD = targetCDMax; //cd of 20 seconds on acquiring new target
}
targetCD--;

p_distance = distance_to_object(target);

script_execute(state);


AnimateNPC(1);
if(state = MoveTowardsPlayer){
	//Selecting sides to check for collision
	if(hspd<=0){
		hCol = bbox_left;
	} else hCol = bbox_right;


	if(vspd<=0){
		vCol = bbox_top;
	} else vCol = bbox_bottom;

	//Stop if we are going to collide into another enemy
	if(vspd!=0){
		if(position_meeting(x,vCol+vspd,pEnemy)){
			vspd = 0;
		}
	}

	if(hspd!=0){
		if(position_meeting(hCol+hspd,y,pEnemy)){
			hspd = 0;
		}
	}

	//If we arent moving, walk around the enemy

	if(hspd ==0 && vspd ==0 && state = MoveTowardsPlayer && distance_to_object(target)<45){
		var distX = abs(x - target.x);
		var distY = abs(y - target.y);
		//If we are closer to the player on the X axis, but not equal to
		if(distX < distY && distX !=0){
			hspd = sign(x-target.x);
		} else if(distY < distX && distY !=0){
			vspd = sign(y-target.y);
		}
	
	}

}

//Wall collision
	if (TileMeetingPrecise(x + hspd, y, collisionMap) || place_meeting(x + hspd, y, pEntity)) {
			var _signToPlayer = sign(target.y - y);
			vspd = moveSpeed * _signToPlayer;
			hspd = 0;
		}else if (TileMeetingPrecise(x - hspd, y, collisionMap) || place_meeting(x - hspd, y, pEntity)) {
			var _signToPlayer = sign(target.y - y);
			vspd = moveSpeed * _signToPlayer;
			hspd = 0;
		} else if (TileMeetingPrecise(x, y+vspd, collisionMap) || place_meeting(x, y+vspd, pEntity)) {
			var _signToPlayer = sign(target.x - x);
			hspd = moveSpeed* _signToPlayer;
			vspd = 0;
			
		} else if (TileMeetingPrecise(x, y-vspd, collisionMap)|| place_meeting(x, y-vspd, pEntity)) {
			var _signToPlayer = sign(target.x - x);
			hspd = moveSpeed* _signToPlayer;
			//vspd = 0;
			
		} 

depth = -bbox_bottom;


x+= hspd;
y+= vspd;