if (PAUSED) {
	if (sprite_exists(sprite_index)) image_index -= IMAGE_SPEED;
	exit;
}

check_collision();
