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
function hitbox_create(_sprite, _owner, _xscale, _hittable, _hitInstFunction) {
	var _inst = instance_create_depth(0, 0, 0, oHitbox);
	with (_inst) {
		owner = _owner;
		x = owner.x;
		y = owner.y;
		image_xscale = _xscale;
		sprite_index = _sprite;
		hittable     = _hittable;
		hit_instance = method(self, _hitInstFunction);
	}
	return _inst;
}
