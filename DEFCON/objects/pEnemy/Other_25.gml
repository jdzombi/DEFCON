event_inherited();

/// @desc Initializes the "spritesDatabase" struct
/// @param {string} prefix
/// @param {array} names
/// @returns {instance} self
sprites_database_init = function(_prefix, _names) {
	/*
		sprites_database_init("sPossessedMan", [
	        ["idle", "Idle"],
	        ["walk", "Walk"],
	        ["attack", "Attack"],
	        ["shadow_shield", "ShadowShield"],
	        ["head_explode", "HeadExplode"],
	    ]);
	*/
	
    var _data, _i, _state, _name;
    
    _i = 0; repeat(array_length(_names)) {
        _data  = _names[_i];
        _state = _data[0];
        _name  = _data[1];
        spritesDatabase[$ _state] = asset_get_index(_prefix + _name);
        ++_i;
    }
	
    return self;
};

/// @desc Initializes the "stateDuration" struct
/// @param {array} durations
/// @returns {instance} self
state_duration_init = function(_dur) {
	var _data, _i, _state, _l, _r;
	
	_i = 0; repeat (array_length(_dur)) {
		_data = _dur[_i];
		_state = _data[0];
		_l = _data[1];
		_r = (array_length(_data) > 2) ? _data[2] : _l;
		stateDuration[$ _state] = [_l, _r];
		++_i;
	}
	
	return self;
}

/// @desc Initializes input - fills the values of the "input" struct
/// @returns {instance} self
init_input = function() {
	input = {
		hdir: choose(1, -1),
		attackP: 0,
	};
	return self;
};

/// @desc Sets the sprite and state duration (when applicable)
/// @returns {instance} self
state_init = function() {
    var _state = fsm.get_current_state();
    
    if (variable_struct_exists(stateDuration, _state)) {
        var _data = stateDuration[$ _state];
        currStateDuration = random_range(_data[0], _data[1]);
    } else {
		currStateDuration = MAX_LLONG;	
	}
	
    sprite_index = spritesDatabase[$ _state];
    image_index  = 0;
    return self;
};

/// @desc Applies gravity - increases vspd
/// @returns {instance} self
apply_gravity = function() {
    vspd = 0;
    return self;
};

/// @returns {bool} Whether I am standing on parCollide (true), or not (false)
on_ground = function() {
	return (place_meeting(x, y+1, parCollide));
};


/// @desc Sets hspd and xscale
/// @param {number} speed
/// @returns {instance} self
set_horizontal_motion = function(_spd) {
	hspd = input.hdir * _spd;
	if (abs(input.hdir)) xscale = input.hdir;
	return self;
};

/// @desc Shaun Spalding collision code modified
/// @returns {instance} self
move_and_collide = function() {
    var _sign;
    
    if (place_meeting(x+hspd, y, parCollide)) {
        _sign = sign(hspd);
        repeat (abs(hspd)) {
            if (place_meeting(x+_sign, y, parCollide)) break;
            x += _sign;
        }
        hspd = 0;
        //flip();
    } else {
        x += hspd;
    }
    
    if (place_meeting(x, y+vspd, parCollide)) {
        _sign = sign(vspd);
        repeat (abs(vspd)) {
            if (place_meeting(x, y+_sign, parCollide)) break;
            y += _sign;
        }
        vspd = 0;
    } else {
        y += vspd;
    }
    
    return self;
};

/// @returns {bool} Whether I flipped (true), or not (false)
check_flip = function() {
    var _flip = false;
	var _buff = bbox_width/2 * xscale;
	if (place_meeting(x+hspd, y, parCollide)) _flip = true;
	if (!_flip && on_ground()) {
		if (!place_meeting(x+hspd+_buff, y+1, parCollide)) _flip = true;
	}
	return _flip;
};

/// @returns {instance} self
flip = function() {
    input.hdir *= -1;
    return self;
};
