function Idle(){
	if (p_distance > 10){
		state = MoveTowardsPlayer;
	}
}

function MoveTowardsPlayer(){
	sprite_index = sWalk;
		
	if (p_distance < 10){
		state = Attack;
	}
	
	var _xS = sign(target.x - x);
	var _yS = sign(target.y - y);
	
	//If we arent about to walk into a wall, reset our timer
	if(!TileMeetingPrecise(x + _xS, y + _yS, collisionMap)){
		calcPathTimer = 0;
	}
	
	if(despawnTimer > 0){
	//if (calcPathTimer-- <= 0 || (abs(p_distance - lastCheckedDistance)>35 && (sign(target.x - x != lastCheckedX)|| sign(target.y - y != lastCheckedY )))){
		calcPathTimer = calcPathDelay;
		var _see_player = mp_grid_path(global.mp_grid, path, x, y, target.x, target.y, 1);
		lastCheckedDistance = p_distance;
		lastCheckedX = sign(target.x);
		lastCheckedY = sign(target.y);
	
		if (_see_player){
			var _pathX = path_get_point_x(path, 1);
			var _pathY = path_get_point_y(path, 1);
			var _angle = point_direction(x, y, _pathX, _pathY);
			
			hspd = lengthdir_x(moveSpeed, _angle);
			vspd = lengthdir_y(moveSpeed, _angle);
			
		//if zombie is stuck on corner, move towards edge to unstuck
		if (TileMeetingPrecise2(x + hspd, y, collisionMap) || TileMeetingPrecise2(x - hspd, y, collisionMap)) {
			if (TileMeetingPrecise2(x + hspd, y + 1, collisionMap)) vspd = -(moveSpeed);
			if (TileMeetingPrecise2(x + hspd, y - 1, collisionMap)) vspd = moveSpeed;
		} else if (TileMeetingPrecise2(x, y+vspd, collisionMap) || TileMeetingPrecise2(x, y-vspd, collisionMap)){
			if (TileMeetingPrecise2(x + 1, y+vspd, collisionMap)) hspd = -(moveSpeed);
			if (TileMeetingPrecise2(x - 1, y+vspd, collisionMap)) hspd = moveSpeed;
		}
			
			
		} else {
			hspd = 0;
			vspd = 0;
		}	
	}
	//}
}
	
function Attack(){
	sprite_index = sAttack;
		hspd = 0;
		vspd = 0;
		
		if (p_distance > 10){
		state = MoveTowardsPlayer;
	}
		
		//TODO Condition for leaving state
	//TODO draw hitboxes towards direction of player
}

function Stunned(){
	vspd = 0;
	hspd = 0;
	stunTimer --;
	
	if(stunTimer<=0){
		state = Idle;
		stunTimer = 0;
	}
	
}

function Death(){
	//TODO add to player score of who defeated the enemy
	//TODO play death animation
	if(irandom_range(0, 10)>8){
		instance_create(x-9,y-5,oPickupTest);
	}
	instance_destroy();
}

function Push(xForce,yForce,obj){
		obj.x += xForce;
		obj.y += yForce;
	
}