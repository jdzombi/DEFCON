if (PAUSED) {
	if (sprite_exists(sprite_index)) image_index -= IMAGE_SPEED;
	exit;
}

blendCycle = (blendCycle + blendCycleSpeed) mod 255;
light.blend = make_colour_rgb(255, 255, 255);//make_colour_hsv(blendCycle, 230, 230);