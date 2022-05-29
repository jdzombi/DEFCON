function Idle(){
	
}

function MoveTowardsPlayer(){
	
	
	if (calcPathTimer-- <= 0){
		calcPathTimer = calcPathDelay;
		var _see_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, 1);
	
	
		if (_see_player){
			var _pathX = path_get_point_x(path, 1);
			var _pathY = path_get_point_y(path, 1);
	
			if (_pathX > x) {
				hspd = 0.5;
			} else if (_pathX < x) {
				hspd = -0.5;
			} else {
				hspd = 0;
			}
	
			if (_pathY > y) {
				vspd = 0.5;
			} else if (_pathY < y) {
				vspd = -0.5;
			} else {
				vspd = 0;
			}
			
			//path_start(path, moveSpeed, path_action_stop, 0);
		}
		
	}	
}