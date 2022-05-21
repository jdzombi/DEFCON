/// @func draw_set_align(alignment)
/// @param {ANCHOR} alignment
/// @desc draw_set_h/valign() in one function
function draw_set_align(_align) {
	// 7 8 9
	// 4 5 6
	// 1 2 3
	switch(_align) {
		case ANCHOR.BOTTOM_LEFT   : draw_set_halign(fa_left);	draw_set_valign(fa_bottom); break;	
		case ANCHOR.BOTTOM_CENTER : draw_set_halign(fa_center);	draw_set_valign(fa_bottom); break;
		case ANCHOR.BOTTOM_RIGHT  : draw_set_halign(fa_right);	draw_set_valign(fa_bottom); break;
		case ANCHOR.MIDDLE_LEFT   : draw_set_halign(fa_left);	draw_set_valign(fa_middle); break;
		case ANCHOR.MIDDLE_CENTER : draw_set_halign(fa_center);	draw_set_valign(fa_middle); break;
		case ANCHOR.MIDDLE_RIGHT  : draw_set_halign(fa_right);	draw_set_valign(fa_middle); break;
		case ANCHOR.TOP_LEFT      : draw_set_halign(fa_left);	draw_set_valign(fa_top);    break;
		case ANCHOR.TOP_CENTER    : draw_set_halign(fa_center);	draw_set_valign(fa_top);    break;
		case ANCHOR.TOP_RIGHT     : draw_set_halign(fa_right);	draw_set_valign(fa_top);    break;
		default					  : draw_set_halign(fa_left);	draw_set_valign(fa_top);    break;
	}
}

/// @func draw_text_outline(x, y, string, [color], [outline_color])
/// @param {number} x
/// @param {number} y
/// @param {string} string
/// @param {int} [color]
/// @param {int} [outline_color]
/// @desc Draws a text with an outline | Shouldn't be used in production
function draw_text_outline(_x, _y, _str, _col = draw_get_color(), _outlineCol = c_black) {
	draw_text_col(_x+1, _y-1, _str, _outlineCol);
	draw_text_col(_x+1, _y+1, _str, _outlineCol);
	draw_text_col(_x-1, _y+1, _str, _outlineCol);
	draw_text_col(_x-1, _y-1, _str, _outlineCol);
	draw_text_col(_x, _y, _str, _col);
}

/// @func draw_text_col(x, y, string, color, [alpha])
/// @param {number} x
/// @param {number} y
/// @param {string} string
/// @param {int} color
/// @param {number} [alpha]
/// @desc draw_text_color() shortened
function draw_text_col(_x, _y, _str, _col, _alpha = draw_get_alpha()) {
	draw_text_color(_x, _y, _str, _col, _col, _col, _col, _alpha);
}

/// @func draw_text_ext_col(x, y, string, sep, w, color, [alpha])
/// @param {number} x
/// @param {number} y
/// @param {string} string
/// @param {number} sep
/// @param {number} w
/// @param {int} color
/// @param {number} [alpha]
/// @desc draw_text_ext_color() shortened
function draw_text_ext_col(_x, _y, _str, _sep, _w, _col, _alpha = draw_get_alpha()) {
	draw_text_ext_color(_x, _y, _str, _sep, _w, _col, _col, _col, _col, _alpha);
}

/// @func draw_reset()
/// @desc Resets the draw stuff
function draw_reset() {
	draw_set_font(DEFAULTS.draw.font);
	draw_set_align(DEFAULTS.draw.alignment);
	draw_set_color(DEFAULTS.draw.color);	
	draw_set_alpha(DEFAULTS.draw.alpha);	
}

/// @func draw_sprite_alpha(sprite, subimg, x, y, alpha)
/// @param {sprite} sprite
/// @param {number} subimg
/// @param {number} x
/// @param {number} y
/// @param {number} alpha
/// @desc Draws a sprite scaled
function draw_sprite_alpha(_sprite, _img, _x, _y, _alpha) {
	draw_sprite_ext(_sprite, _img, _x, _y, image_xscale, image_yscale, image_angle, c_white, _alpha);
}

/// @func draw_sprite_scaled(sprite, subimg, x, y, xscale, [yscale])
/// @param {sprite} sprite
/// @param {number} subimg
/// @param {number} x
/// @param {number} y
/// @param {number} xscale
/// @param {number} [yscale]
/// @desc Draws a sprite scaled
function draw_sprite_scaled(_sprite, _img, _x, _y, _xscale, _yscale = _xscale) {
	draw_sprite_ext(_sprite, _img, _x, _y, _xscale, _yscale, image_angle, c_white, image_alpha);
}

/// @func draw_self_scaled(xscale, yscale)
/// @param {number} xscale
/// @param {number} yscale
/// @desc Draws an instance scaled
function draw_self_scaled(_xscale, _yscale) {
	draw_sprite_ext(sprite_index, image_index, x, y, _xscale*image_xscale, _yscale*image_yscale, image_angle, image_blend, image_alpha);
}

/// @func draw_rectangle_size(x, y, width, height, [outline])
/// @param {number} x
/// @param {number} y
/// @param {number} width
/// @param {number} height
/// @param {bool} [outline]
function draw_rectangle_size(_xx, _yy, _w, _h, _outline = false) {
	draw_rectangle(_xx, _yy, _xx+_w-1, _yy+_h-1, _outline);
}
