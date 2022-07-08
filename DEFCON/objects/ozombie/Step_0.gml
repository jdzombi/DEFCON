nearestPlayer = instance_nearest(x, y, oPlayer);
p_distance = distance_to_object(nearestPlayer);

script_execute(state);


AnimateNPC(1);

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

if(hspd ==0 && vspd ==0 && state = MoveTowardsPlayer && distance_to_object(nearestPlayer)<45){
	var distX = abs(x - nearestPlayer.x);
	var distY = abs(y - nearestPlayer.y);
	//If we are closer to the player on the X axis, but not equal to
	if(distX < distY && distX !=0){
		hspd = sign(x-nearestPlayer.x);
	} else if(distY < distX && distY !=0){
		vspd = sign(y-nearestPlayer.y);
	}
	
}

//Wall collision
	if (TileMeetingPrecise(x + hspd, y, collisionMap)) {
			var _signToPlayer = sign(nearestPlayer.y - y);
			vspd = moveSpeed * _signToPlayer;
			hspd = 0;
		}else if (TileMeetingPrecise(x - hspd, y, collisionMap)) {
			var _signToPlayer = sign(nearestPlayer.y - y);
			vspd = moveSpeed * _signToPlayer;
			hspd = 0;
		} else if (TileMeetingPrecise(x, y+vspd, collisionMap)) {
			var _signToPlayer = sign(nearestPlayer.x - x);
			hspd = moveSpeed* _signToPlayer;
			vspd = 0;
			
		} else if (TileMeetingPrecise(x, y-vspd, collisionMap)) {
			var _signToPlayer = sign(nearestPlayer.x - x);
			hspd = moveSpeed* _signToPlayer;
			//vspd = 0;
			
		} 




x+= hspd;
y+= vspd;