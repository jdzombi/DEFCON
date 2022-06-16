//TODO move to a reload function within player states script


//ID of our current gun
var _tempGunID = oGame.playerCurrentLoadout[currentGun,0];

if((oGame.playerCurrentLoadout[currentGun,2]>0)&& oGame.playerCurrentLoadout[currentGun,1]!= oGame.gunArray[_tempGunID,3]){

	//How many bullets in the mag when reloading
	var _clipRemaining = oGame.playerCurrentLoadout[currentGun,1];

	//If we have enough ammo for a full mag
	if(_clipRemaining + oGame.playerCurrentLoadout[currentGun,2] > (oGame.gunArray[_tempGunID,3])){
	
		//Remove max clip minus clip remaining from reserve ammo
		oGame.playerCurrentLoadout[currentGun,2] -= (oGame.gunArray[_tempGunID,3]-_clipRemaining);
		//Set mag to max
		oGame.playerCurrentLoadout[currentGun,1] = oGame.gunArray[_tempGunID,3];
	
	} else {
		//Otherwise, add the remaining ammo from reserve into clip
		oGame.playerCurrentLoadout[currentGun,1] += oGame.playerCurrentLoadout[currentGun,2];
		//Empty the reserve ammo
		oGame.playerCurrentLoadout[currentGun,2] = 0;
	}

}