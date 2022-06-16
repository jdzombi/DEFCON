event_inherited();

/// @Override
check_input = function() {
	var _state, _toggleHdir, _hdir, _flip, _diff, _attack, _shield;
	
	input = {
		hdir: keyboard_check(vk_right) - keyboard_check(vk_left),
		attackP: keyboard_check_pressed(ord("Z")),
		shieldP: keyboard_check_pressed(ord("X")),
	};
	
	return self;
	
};


/// @Override
hit = function(_damage, _attackType) {
	hp -= _damage;
	if (hp <= 0){
		instance_destroy();  //TODO: replace w/ death state
	}
	return true;
};
