nearestPlayer = instance_nearest(x, y, oPlayer);

if (target != nearestPlayer && targetCD <= 0){ //get target if another player comes closer than current target
	target = nearestPlayer;
	targetCD = targetCDMax; //cd of 20 seconds on acquiring new target
}
targetCD--;

p_distance = distance_to_object(target);
//Despawn if too far from the player

if(p_distance > global.despawnDistance){
	despawnTimer--;
	if(despawnTimer<=0) instance_destroy();
	
} else if(p_distance < global.despawnDistance - 100) despawnTimer = despawnTimerMax; 


script_execute(state);


AnimateNPC(1);
if(state = MoveTowardsPlayer){
	//Selecting sides to check for collision
	if(hspd<=0){
		hCol = bbox_left;
	} else hCol = bbox_right;


	if(vspd<=0){
		vCol = bbox_top;
	} else vCol = bbox_bottom;

	//Stop if we are going to collide into another enemy
	if(vspd!=0){
		if(position_meeting(x,vCol+vspd,pEnemy)){
			vspd = 0;
		}
	}

	if(hspd!=0){
		if(position_meeting(hCol+hspd,y,pEnemy)){
			hspd = 0;
		}
	}

}
	//wall collision
	if (TileMeetingPrecise2(x + hspd, y, collisionMap)) {
		if (hspd > 0) {
			hspd = 0;
		}
	} else if (TileMeetingPrecise2(x - hspd, y, collisionMap)) {
		if (hspd < 0) {
			hspd = 0;
		}
	} else if (TileMeetingPrecise2(x, y+vspd, collisionMap)) {
		if (vspd > 0) {
			vspd = 0;
		}
	} else if (TileMeetingPrecise2(x, y-vspd, collisionMap)) {
		if (vspd < 0) {
			vspd = 0;
		}	
	} 
	
if (hspd == 0 && vspd == 0){
	stuckTimer--	
}

if (stuckTimer <= 0) {
	instance_destroy();		
}
	

depth = -bbox_bottom;


x+= hspd;
y+= vspd;

if (oGame.is_multiplayer && oGame.is_server && updateTimer <= 0){
	var instanceID = instance_id;
	var buffer = buffer_create(7, buffer_fixed, 1);
	
	buffer_write(buffer, buffer_u8, DATA.ENEMY_SYNC);
	buffer_write(buffer, buffer_s16, instanceID);
	buffer_write(buffer, buffer_s16, x);
	buffer_write(buffer, buffer_s16, y);
	
	SendPacketToClients(buffer);
	
	buffer_delete(buffer);
	updateTimer = updateTimerMax;
}
updateTimer--;