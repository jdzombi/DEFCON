event_inherited();

/// @Override
hit = function(_damage) {
	hp -= _damage;
	show_debug_message("hit!");
	if (hp <= 0){
		state = Death;
	} else {
	stunTimer = stunTimerMax;
	state = Stunned;
	}
	
	return true;
};
