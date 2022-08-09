/// @func hurtbox_create
/// @param {instance} owner
/// @param {sprite} sprite
/// @param {function} [collision_checker]
/// @returns {instance} Id of the instance
function hurtbox_create(_owner, _sprite, _collisionChecker = function() {}) {
	var _inst = instance_create_depth(0, 0, 0, oHurtbox);
	with (_inst) {
		owner = _owner;
		x = owner.x;
		y = owner.y;
		sprite_index = _sprite;
		check_collision = method(self, _collisionChecker);
	}
	return _inst;
}

/// @func hitbox_create
/// @param {sprite} sprite
/// @param {instance} owner
/// @param {number} xscale
/// @param {array} hittable
/// @param {function} hit_instance_function
/// @returns {instance} Id of the created instance
function hitbox_create(_sprite, _owner, _direction, _hittable, _hitInstFunction) {
	var _inst = instance_create_depth(0, 0, 0, oHitbox);
	with (_inst) {
		owner = _owner;
		x = owner.x;
		y = owner.y;
		sprite_index = _sprite;
		image_index = _direction;	
		var total = sprite_get_number(_sprite);
		endFrame= (_direction + (total/8)) % total-1;	
		hittable     = _hittable;
		hit_instance = method(self, _hitInstFunction);
	}
	return _inst;
}

/// @func hitbox_create
/// @param {sprite} sprite
/// @param {instance} owner
/// @param {number} xscale
/// @param {array} hittable
/// @param {function} hit_instance_function
/// @returns {instance} Id of the created instance
function hitbox_create2(_sprite, _owner, _direction, _hittable, _hitInstFunction) {
	var _inst = instance_create_depth(0, 0, 0, oHitbox);
	with (_inst) {
		owner = _owner;
		x = owner.x;
		y = owner.y;
		sprite_index = _sprite;
		//image_index = _direction;	
		image_index = owner.image_index;
		var total = sprite_get_number(_sprite);
		endFrame= floor(((_direction + (total/4)) % total)-1);	
		hittable     = _hittable;
		hit_instance = method(self, _hitInstFunction);
	}
	return _inst;
}


/// @func animation_end()
/// @returns {bool} Whether the sprite_index has stopped animating (true), or not (false)
/// @desc Checks if the current sprite_index has stopped animating
function animation_end(endFrame) {
	//return (image_index + image_speed*sprite_get_speed(sprite_index)/(sprite_get_speed_type(sprite_index)==spritespeed_framespergameframe? 1 : game_get_speed(gamespeed_fps)) >= endFrame);	
	return image_index>=endFrame;	
}

/// @param {int} id
/// @param {ds_type} type
function ds_destroy(_id, _type) {
    switch (_type) {
        case ds_type_grid       : if (ds_exists(_id, ds_type_grid))     ds_grid_destroy(_id);       break;
        case ds_type_list       : if (ds_exists(_id, ds_type_list))     ds_list_destroy(_id);       break;
        case ds_type_map        : if (ds_exists(_id, ds_type_map))      ds_map_destroy(_id);        break;
        case ds_type_priority   : if (ds_exists(_id, ds_type_priority)) ds_priority_destroy(_id);   break;
        case ds_type_queue      : if (ds_exists(_id, ds_type_queue))    ds_queue_destroy(_id);      break;
        case ds_type_stack      : if (ds_exists(_id, ds_type_stack))    ds_stack_destroy(_id);      break;
        default: break;
    }
}