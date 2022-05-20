if(instance_exists(oPlayer)){
follow = oPlayer;	
}


/// @description Update to Player's new position
if(instance_exists(follow)){
	//oPlayer.transitionEnter = false;
	x = follow.x;
	y = follow.y;
	
}

camera_set_view_size(cam, RESOLUTION_W, RESOLUTION_H);
room_set_viewport(room, 0, true, 0, 0, RESOLUTION_W * SCALE_SIZE, RESOLUTION_H * SCALE_SIZE);
