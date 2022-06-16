pCol = place_meeting(x, y, oPlayer)
if (pCol) {
	//TODO Make variants
	oGame.playerCurrentLoadout[oPlayer.currentGun,2] +=	8;
	instance_destroy();
}

HoverObject(.1,.1);


