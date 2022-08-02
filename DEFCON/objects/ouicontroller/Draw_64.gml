 //enter as player or client
if (global.mainMenu){
	var menu_str = "Press Tab to start Singleplayer\nPress SPACE to host game\nPress ENTER to join game";
	
	draw_text(0, 0, menu_str);
}

//TODO Make an actual GUI for the ammo
if (combatUI){	
	//Ammo UI
	var xPlacementAmmo = display_get_gui_width()-sprite_get_width(sAmmoUI);
	var yPlacementAmmo = display_get_gui_height()-sprite_get_height(sAmmoUI);
	draw_set_font(sloothFont);
	draw_sprite(sAmmoUI,0,xPlacementAmmo-10,yPlacementAmmo-5);
	draw_text(xPlacementAmmo, yPlacementAmmo, string(oGame.playerCurrentLoadout[0,1])+"/"+string(oGame.playerCurrentLoadout[0,2]));
	
	//Points UI
	var xPlacementPoints = xPlacementAmmo;
	var yPlacementPoints = yPlacementAmmo - sprite_get_height(sPointsUI);
	draw_sprite(sPointsUI,0,xPlacementPoints,yPlacementPoints-7);
	draw_set_font(sloothFontPoints);
	//TODO draw points for all players
	draw_text(xPlacementPoints+4, yPlacementPoints-1, string(oPlayer.playerScore));
}