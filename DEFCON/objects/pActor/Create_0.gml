/// @desc Checks input - updates the values of the "input" struct
/// @returns {instance} self
check_input = function() {
	return self;
};


/// @param {real} damage
/// @param {ATTACK_TYPE} attack_type
/// @returns {bool} Whether the instance has been hit (true), or not (false)
hit = function(_damage, _attackType) {
	trace("HIT ", object_get_name(object_index), " :: Method not overridden.");
	return false;	
}
