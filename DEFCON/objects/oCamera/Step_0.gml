/// @description Update camera

if !(instance_exists(follow)) {
	x = room_height;
	follow = oGame;
}

//Update Position
if(instance_exists(follow)){
	
	if (instance_exists(oPlayer) && (!(oPlayer.transitionDoorEnter))) {
		xTo = follow.x;
		yTo = follow.y;
	}
}

//Update Object Position aka Camera Movement Speed

x+= ((xTo - x) / 15);
y+= ((yTo - y) / 15);

//Keep camera centered inside room
//x = clamp(x, viewWidthHalf, room_width - viewWidthHalf);
//y = clamp(y, viewHeightHalf, room_height - viewHeightHalf);

//Screenshake

if (xShake){
z1 = random_range(-shakeRemain, shakeRemain);
x += z1;
}
if (yShake){
z2 = random_range(-shakeRemain, shakeRemain);
y+= z2;
	}

shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));
//camera_set_view_pos(cam, x - viewWidthHalf, y - viewHeightHalf);
