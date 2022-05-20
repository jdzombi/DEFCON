/// @description Set up camera


//Camera
cam = view_camera[0];

//Object to follow
follow = oPlayer;

//old
//viewWidthHalf = camera_get_view_width(cam)*0.5;
//viewHeightHalf = camera_get_view_height(cam)*0.5;
viewPaddingValueWidth = 48;
viewPaddingValueHeight = 12; 


xTo = xstart;
yTo = ystart;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;

xShake = false;
yShake = false;
z1 = 0;
z2 = 0;
