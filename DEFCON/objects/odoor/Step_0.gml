/// @description Insert description here
// You can write your code in this editor
var _p = instance_nearest(x,y,oPlayer);
if (pickUp() && _p.playerScore>=cost) {
	
	_p.playerScore-=cost;
	instance_destroy();	
}

if (distance_to_object(oPlayer) < 20) {
	showText = 1;
} else {
	showText = 0;
}