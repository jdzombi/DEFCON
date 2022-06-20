
p_distance = distance_to_object(oPlayer);

script_execute(state);
	if (TileMeetingPrecise(x + hspd, y, collisionMap)) {
			var _signToPlayer = sign(oPlayer.y - y);
			vspd = moveSpeed * _signToPlayer;
			hspd = 0;
		}else if (TileMeetingPrecise(x - hspd, y, collisionMap)) {
			var _signToPlayer = sign(oPlayer.y - y);
			vspd = moveSpeed * _signToPlayer;
			hspd = 0;
		} else if (TileMeetingPrecise(x, y+vspd, collisionMap)) {
			var _signToPlayer = sign(oPlayer.x - x);
			hspd = moveSpeed* _signToPlayer;
			vspd = 0;
			
		} else if (TileMeetingPrecise(x, y-vspd, collisionMap)) {
			var _signToPlayer = sign(oPlayer.x - x);
			hspd = moveSpeed* _signToPlayer;
			//vspd = 0;
			
		} 
		

AnimateNPC(1);

x+= hspd;
y+= vspd;