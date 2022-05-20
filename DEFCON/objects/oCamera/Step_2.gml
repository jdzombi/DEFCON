/// @description Camera clamp/position logic

//Keep camera centered inside room
var _viewTopLeftX = 0;
var _viewTopLeftY = 0;
var _viewBottomRightX = (room_width - camera_get_view_width(cam));
var _viewBottomRightY = (room_height - camera_get_view_height(cam));
var _viewWidthHalf = camera_get_view_width(cam)*0.5;
var _viewHeightHalf = camera_get_view_height(cam)*0.5;
var _camX = x - _viewWidthHalf;
var _camY = y - _viewHeightHalf;
_camX = clamp(_camX, _viewTopLeftX, _viewBottomRightX)+z1;
_camY = clamp(_camY, _viewTopLeftY, _viewBottomRightY)+z2;

//Finally, set camera position
camera_set_view_pos(cam, _camX, _camY);
