if (distance_to_object(oPlayer) <= 10){
	DrawOutline(upixelW, texelW, upixelH, texelH);
	draw_self();
	shader_reset();
} else {
	draw_self();
	shader_reset();
	
}
