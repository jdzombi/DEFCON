///@desc Screenshake(magnitude/frames)
///@arg Magnitude sets the strength of the shake (distance range)
///@arg Frames sets the length of the shake in frames (60 = 1 seconds)
function ScreenShake(argument0, argument1, xS,yS) {

	with(global.iCamera){
		xShake = xS;
		yShake = yS;
		if(argument0>shakeRemain){
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
	}

	xShake = false;
	yShake = false;
}
