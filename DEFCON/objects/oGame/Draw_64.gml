 //enter as player or client
if (room == rMenu){
	var menu_str = "Press SPACE to host game\nPress ENTER to join game";
	
	draw_text(0, 0, menu_str);
}

//TODO Make an actual GUI for the ammo
if (room != rMenu){
	draw_text(0, 0, string(playerCurrentLoadout[0,1])+"/"+string(playerCurrentLoadout[0,2]));
}