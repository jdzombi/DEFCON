nearestPlayer = instance_nearest(x, y, oPlayer);
p_distance = distance_to_object(nearestPlayer);

nearestEnemy = instance_nearest(x+hspd, y+vspd, pEnemy);

script_execute(state);
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

if(position_meeting(x,y,pEnemy)){
	
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, pEnemy, _list, false);
	
	var _xPush = sign(x-nearestEnemy.x)*(_num*10);
	var _yPush = sign(y-nearestEnemy.y)*(_num*10);
	
	if(!TileMeetingPrecise(x-_xPush, y - _yPush, collisionMap)){
		x-=_xPush;
		y-=_yPush;
	} else {
		with(nearestEnemy){
			x+=_xPush;
			y+=_yPush;
		}
	
	}
	
	hspd = 0;
	vspd = 0;
}

AnimateNPC(1);

x+= hspd;
y+= vspd;