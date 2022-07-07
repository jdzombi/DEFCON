event_inherited();

/// @Override
hit = function(_damage, _attackType) {
	hp -= _damage;
	if (hp <= 0){
		state = Death;
	} else {
	stunTimer = stunTimerMax;
	state = Stunned;
	}
	return true;
};
