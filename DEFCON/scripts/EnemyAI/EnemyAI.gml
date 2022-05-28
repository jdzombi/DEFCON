function CheckForPlayer(){
	var _see_player = mp_grid_path(global.mp_grid, path, x, y, oPlayer.x, oPlayer.y, choose(0,1));
	
	return _see_player;
}

function MoveTowardsPlayer(){
		
		path_start(path, moveSpeed, path_action_stop, false);
			
}