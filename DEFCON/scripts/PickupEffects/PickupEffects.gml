//effects for pickups on the ground

function HoverObject(speed,height){
	y += sin(timer * speed) * height;
	timer++;
}

/*in order for this to work, you have to leave a 1px space around
the sprite. To change the color of the outline, put a colored outline w/
alpha 1 in the sprite*/
function DrawOutline(pw, tw, ph, th){
	shader_set(shOutline);
	shader_set_uniform_f(pw, tw);
	shader_set_uniform_f(ph, th);
}
