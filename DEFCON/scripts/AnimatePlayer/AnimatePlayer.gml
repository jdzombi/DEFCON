function AnimatePlayer(argument0) {
	//Update Sprite
	var _totalFrames = sprite_get_number(sprite_index)/8;
	mouseAngle = round(mouseAngle/45);
	
	var _modify = 0;
	if((mouseAngle+4)%8 == (inputDirection/45)){
		_modify = -1;
	} else {
		_modify = 1;	
	}

	image_index = localFrame + (mouseAngle * _totalFrames);
	localFrame += _modify*(sprite_get_speed(sprite_index) / (2*FRAME_RATE*argument0));

	//Animations Loop
	if(localFrame>= _totalFrames xor localFrame<0){
		animationEnd = true;
		localFrame-=(_totalFrames)*_modify;
	} else animationEnd = false;



}


function AnimateNPC(argument0) {
	//Update Sprite
	
	var _totalFrames = sprite_get_number(sprite_index)/4;
	var _cardinal = round(point_direction(x,y,oPlayer.x,oPlayer.y)/90);

	image_index = localFrame + (_cardinal*_totalFrames);
	localFrame += sprite_get_speed(sprite_index) / (2*FRAME_RATE*argument0);

	//Animations Loop
	if(localFrame>= _totalFrames){
		animationEnd = true;
		localFrame-=_totalFrames;
	} else animationEnd = false;

}
