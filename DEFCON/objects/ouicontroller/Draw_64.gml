 //enter as player or client
if (global.mainMenu){
	var menu_str = "Press Tab to start Singleplayer\nPress SPACE to host game\nPress ENTER to join game";
	
	draw_text(0, 0, menu_str);
}

//TODO Make an actual GUI for the ammo
if (combatUI){
	draw_text(0, 0, string(oGame.playerCurrentLoadout[0,1])+"/"+string(oGame.playerCurrentLoadout[0,2]));
}