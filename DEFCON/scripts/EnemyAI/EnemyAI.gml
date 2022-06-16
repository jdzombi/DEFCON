function Idle(){
	if (p_distance > 5){
		state = MoveTowardsPlayer;
	}
}

function MoveTowardsPlayer(){
	sprite_index = sWalk;
		//Enter Move State
		
		
	if (p_distance < 5){
		state = Attack;
	}

	
	
	if (calcPathTimer-- <= 0){
		calcPathTimer = calcPathDelay;
		var _see_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, 1);
	
	
		if (_see_player){
			var _pathX = path_get_point_x(path, 1);
			var _pathY = path_get_point_y(path, 1);
			var _angle = point_direction(x, y, _pathX, _pathY);
			
			hspd = lengthdir_x(moveSpeed, _angle);
			vspd = lengthdir_y(moveSpeed, _angle);
			
		} else {
			hspd = 0;
			vspd = 0;
		}	
	}
}
	
function Attack(){
	sprite_index = sAttack;
		hspd = 0;
		vspd = 0;
		
		if (p_distance > 5){
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
	//TODO play death animation
	instance_destroy();
}

function Push(xForce,yForce,obj){
		obj.x += xForce;
		obj.y += yForce;
}