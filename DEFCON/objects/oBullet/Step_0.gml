if (distance_to_object(oPlayer)>150){
	instance_destroy();
}


var _xto, _yto, _inst;
_xto = x + lengthdir_x(spd, dir);
_yto = y + lengthdir_y(spd, dir);

if (TileMeetingPrecise(x, y, collisionMap)) {
		instance_destroy();
	}
	
_inst = collision_line(x, y, _xto, _yto, pEnemy, false, true); 
if (_inst != noone) {
    if (_inst.hit(damage)) {
		instance_destroy();
	
        exit;
    }
}

x = _xto;
y = _yto;
