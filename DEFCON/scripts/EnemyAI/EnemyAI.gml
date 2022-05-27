function CheckForPlayer(){
	var _dis = distance_to_object(oPlayer);
	var _see_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, choose(0,1));
	
	if (_see_player) {
		path_start(path, moveSpeed, path_action_stop, false);
	}
}

function MoveTowardsPlayer(){
		
		//if(instance_exists(oPlayer)){
			
			//hspd = 1;
			
			
		//}
}