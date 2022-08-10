if (distance_to_object(oPlayer)>150){
	instance_destroy();
}


var _xto, _yto, _inst;
_xto = x + lengthdir_x(spd, dir);
_yto = y + lengthdir_y(spd, dir);

//Allows us to shoot through corners/walls we are close to, preventing bullet despawn where not intended
if (TileMeetingPrecise(x, y, collisionMap) || place_meeting(x,y,oDoor)) {
		var _inst = instance_create(x,y,oSpark);
		with(_inst){
			instOwner = oBullet.instOwner;
		}
		instance_destroy();
	}
	
_inst = collision_line(x, y-12, _xto, _yto, pEnemy, false, true); 
if (_inst != noone) {
    if (_inst.hit(damage)) {
		instOwner.playerScore+=10;
		if (_inst.hp <= 0) instOwner.playerScore+=50;
		Push2(lengthdir_x(spd/2, dir),lengthdir_y(spd, dir),_inst);
		instance_destroy();
	
        exit;
    }
}

x = _xto;
y = _yto;
