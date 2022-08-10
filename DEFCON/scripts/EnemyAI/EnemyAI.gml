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
	
	if(despawnTimer > 0){
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
		var tempFrame = image_index - (image_index)%4;

		
		hitbox = hitbox_create2(sGreenAttackHitbox, id, floor(tempFrame)+1,
						[oPlayer], function(_inst) {
			            	with(_inst){
								hit(1);	
							}
							
			            }
					);
		
		if(animationEnd){
			instance_destroy(hitbox);
			hitbox = noone;
		}
		
		
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
	instance_destroy(self);
}

function Push(xForce,yForce,obj){

		if(!TileMeetingPrecise(obj.x+xForce,obj.y+yForce,"Col")){
		obj.x += xForce;
		obj.y += yForce;
		}
}