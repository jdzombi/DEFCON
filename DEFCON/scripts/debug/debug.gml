/// @func draw_bbox()
/// @desc Draws the bounding box of the calling instance
function draw_bbox() {
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}

/// @func trace(args...)
/// @desc Better debug log
function trace() {
	var _str = "";
	var _i = 0; repeat(argument_count) {
		_str += string(argument[_i]);
		++_i;
	}
	show_debug_message(_str);
}

/// @func concat(args...)
/// @desc Concat strings
function concat() {
	var _str = "";
	var _i = 0; repeat(argument_count) {
		_str += string(argument[_i]);
		++_i;
	}
	return _str;
}