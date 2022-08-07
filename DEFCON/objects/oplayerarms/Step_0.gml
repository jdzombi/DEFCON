if(owner == noone) instance_destroy();

x = owner.x;
y = owner.y;
depth = oPlayer.depth - 1;

//If we are shooting or reloading
if((sprite_index==sScientistArmReload || sprite_index==sScientistArmShoot)){
	busy = true;
	
	var _totalFrames = sprite_get_number(sprite_index)/8;
	mouseAngle = owner.mouseAngle;
	
	
	image_index = localFrame + (mouseAngle * _totalFrames);
	localFrame += (sprite_get_speed(sprite_index) / (FRAME_RATE));
	
	if(localFrame>= _totalFrames xor localFrame<0){
		animationEnd = true;
		busy = false;
	} else animationEnd = false;
	show_debug_message(localFrame);
} else localFrame = 0;

if(!busy){
	sprite_index = owner.armSpriteIndex;
		
}