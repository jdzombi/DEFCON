// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function HoverObject(object){
	object.y = object.y + sin(object.timer * 0.1) * 0.1;
}