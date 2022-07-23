//effects for pickups on the ground
function HoverObject(speed,height){
	y += sin(timer * speed) * height;
	timer++;
}

/*in order for this to work, you have to leave a 1px space around
the sprite. To change the color of the outline, put a colored outline w/
alpha 1 in the sprite*/
function DrawOutline(uniForm_Handle, texture_width, texture_height){
	shader_set(shOutline);
	shader_set_uniform_f(uniForm_Handle, texture_width, texture_height);
}


function addAmmo(amount){
	//TODO Make variants
	oGame.playerCurrentLoadout[oPlayer.currentGun,2] +=	amount;
	//Make sure we don't go over the max ammo capacity
	if((oGame.playerCurrentLoadout[oPlayer.currentGun,2] > oGame.gunArray[oPlayer.currentGun,5])){
		oGame.playerCurrentLoadout[oPlayer.currentGun,2] = oGame.gunArray[oPlayer.currentGun,5];	
	}
//TODO: Make ammo boxes not disappear if you are full on ammo	
}