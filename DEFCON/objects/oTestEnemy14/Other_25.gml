event_inherited();

/// @Override
hit = function(_damage, _attackType) {
	hp -= _damage;
	if (hp <= 0){
		instance_destroy();  //TODO: replace w/ death state
	}
	return true;
};
