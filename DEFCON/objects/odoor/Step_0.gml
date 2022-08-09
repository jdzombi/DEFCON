/// @description Insert description here
// You can write your code in this editor
var _p = instance_nearest(x,y,oPlayer);
if (pickUp() && _p.playerScore>=cost) {
	
	_p.playerScore-=cost;
	instance_destroy();	
}