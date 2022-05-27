//TODO move to a reload function within player states script
//ID of our current gun
var _tempGunID = oGame.playerCurrentLoadout[currentGun,0];
//Set our mag to the max val
oGame.playerCurrentLoadout[currentGun,1] = oGame.gunArray[_tempGunID,3];