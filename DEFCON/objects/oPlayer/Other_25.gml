event_inherited();

/// @Override
hit = function(_damage, _attackType){ 

if(invincibilityTimer>=0){
	return false;	
} else {
	invincibilityTimer = invincibilityTimerMax;
	hp -= _damage;
	if (hp <= 0){
		state = PlayerStateDown;
	} 
	return true;
	
}

};
