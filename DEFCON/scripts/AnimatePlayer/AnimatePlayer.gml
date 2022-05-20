function AnimatePlayer(argument0) {
	//Update Sprite
	var _totalFrames = sprite_get_number(sprite_index)/8;
	mouseAngle = round(oPlayer.mouseAngle/45);
	

	image_index = localFrame + (mouseAngle * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / (2*FRAME_RATE*argument0);

	//Animations Loop
	if(localFrame>= _totalFrames){
		animationEnd = true;
		localFrame-=_totalFrames;
	} else animationEnd = false;



}


function AnimateNPC(argument0) {
	//Update Sprite
	
	var _totalFrames = sprite_get_number(sprite_index)/4;
	

	image_index = localFrame + (cardinal*_totalFrames);
	localFrame += sprite_get_speed(sprite_index) / (2*FRAME_RATE*argument0);

	//Animations Loop
	if(localFrame>= _totalFrames){
		animationEnd = true;
		localFrame-=_totalFrames;
	} else animationEnd = false;

}
