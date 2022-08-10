if (PAUSED) {
	if (sprite_exists(sprite_index)) image_index -= IMAGE_SPEED;
	exit;
}

if (enabled) {
	
if(owner.object_index == oPlayer){
		_inst = instance_place(x, y, pEnemy); 
	if (_inst != noone) {
	    if (_inst.hit(damage)) {
			owner.playerScore+=10;
			if (_inst.hp <= 0) owner.playerScore+=50;
			var _dir = point_direction(owner.x, owner.y,_inst.x,  _inst.y);
			Push(lengthdir_x(8, _dir),lengthdir_y(8, _dir),_inst);
			
	    }
	}
}
	
	ds_list_clear(hitListFrame);
	_num = instance_place_list(x, y, oHurtbox, hitListFrame, false);
	
	// Hit
	var _num, _obj, _inst, _found, _i, _j;
	_i = 0; repeat (_num) {
		_inst = hitListFrame[| _i].owner; ++_i;
	
		// Check if it has been hit this frame
		if (ds_list_find_index(hitList, _inst) != -1) continue;
	
		// Check if it is a valid hittable object
		_found = false;
		_j = 0; repeat (array_length(hittable)) {
			_obj = hittable[_j]; ++_j;
			if ((_inst.object_index == _obj) || object_is_ancestor(_inst.object_index, _obj)) {
				_found = true;
				break;
			}
		}
		if (!_found) continue;
	
		// Add to the list of instances hit this frame and perform the hitting
		ds_list_add(hitList, _inst);
		hit_instance(_inst);
		//Melee Knockback
		var _dir = point_direction(owner.x, owner.y,_inst.x,  _inst.y);
		Push(lengthdir_x(8, _dir),lengthdir_y(8, _dir),_inst);
		
	}
}

// Destroy when animation ends
if (animation_end(endFrame-1)) {
	instance_destroy();
	exit;
}
