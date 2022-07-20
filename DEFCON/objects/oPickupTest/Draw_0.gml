var texture = sprite_get_texture(sprite_index,image_index);
var texture_width = texture_get_texel_width(texture);
var texture_height = texture_get_texel_height(texture);

if (distance_to_object(oPlayer) <= 10){
	DrawOutline(uniform_Handle, texture_width, texture_height);
	draw_self();
	shader_reset();
} else {
	draw_self();
	shader_reset();
	
}
