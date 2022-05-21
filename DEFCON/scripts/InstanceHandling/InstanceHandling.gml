/// @param {number} x		The x position the object will be created at
/// @param {number} y		The y position the object will be created at
/// @param {object} obj		The object index of the object to create an instance of
/// @returns {real}			The newly created instance
function instance_create(_x, _y, _obj) {
	return instance_create_depth(_x, _y, depth, _obj);
}

/// @desc Sets the starting (x,y) of an instance
/// @param {number} x		The x position of the instance
/// @param {number} y		The y position of the instance
function instance_set_start_pos(_x, _y) {
	xstart = _x; x = _x;
	ystart = _y; y = _y;
}

/// @param	 {real}	[instance]
/// @returns {real}	noone
function instance_destroy_safe(_inst = id) {
	if (instance_exists(_inst)) instance_destroy(_inst);
	return noone;
}
