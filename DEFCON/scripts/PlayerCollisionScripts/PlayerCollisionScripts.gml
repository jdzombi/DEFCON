function TileMeetingPrecise(_xp, _yp, _layer) {
	var _tm = layer_tilemap_get_id(_layer);

	var _checker = oPreciseTileChecker;
	if !(instance_exists(_checker)) {
		instance_create_depth(0, 0, -9999, _checker);
		//_checker.visible = (global.debugMode) ? true : false;
		_checker.visible = false;
	}

	var _x1 = tilemap_get_cell_x_at_pixel(_tm, (bbox_left + 0) + (_xp - x), y);
	var _y1 = tilemap_get_cell_y_at_pixel(_tm, x, (bbox_top + 0) + (_yp - y));
	var _x2 = tilemap_get_cell_x_at_pixel(_tm, (bbox_right + 1) + (_xp - x), y);
	var _y2 = tilemap_get_cell_y_at_pixel(_tm, x, (bbox_bottom + 1) + (_yp - y));
	
	
	//Allows for walking off the top of the screen for edges
	if(_y1==-1){
		_y1 = 0;	
	}

	for (var _x = _x1; _x <= _x2; _x++) {
		for (var _y = _y1; _y <= _y2; _y++) {
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
		    if (_tile) {
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				if (place_meeting(_xp, _yp, _checker)) {
					return true;
				}
		    }
		}
	}

	return false;
}

function PlayerCollision() {

	var _entityList = ds_list_create();

	//Horizontal Entities
	var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);
	var _snapX;
	while (_entityCount > 0) {
		//var _entityList = ds_list_create();
		var _entityCheck = _entityList[|0];	
		if (_entityCheck.entityCollision) {
			//Move as close as to possible to the entity
			if (sign(hSpeed) == -1) {
				_snapX = _entityCheck.bbox_right + 1;
			}
			else {
				_snapX = _entityCheck.bbox_left - 1;
			}
			x = _snapX;
			hSpeed = 0;
			x = round(x);
			collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	ds_list_clear(_entityList);

	//Vertical Entities
	var _entityCount = instance_position_list(x, y + vSpeed, pEntity, _entityList, false);
	var _snapY;
	while (_entityCount > 0) {
		var _entityCheck = _entityList[|0];	
		if (_entityCheck.entityCollision) {
			//Move as close as to possible to the entity
			if (sign(vSpeed) == -1) {
				_snapY = _entityCheck.bbox_bottom + 1;
			}
			else {
				_snapY = _entityCheck.bbox_top - 1;
			}
			y = _snapY;
			vSpeed = 0;
			y = round(y);
			collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	ds_list_clear(_entityList);

	//Diagonal Entities
	var _entityCount = instance_position_list(x + (sign(hSpeed) * 4), y + (sign(vSpeed) * 4), pEntity, _entityList, false);
	while (_entityCount > 0) {
		var _entityCheck = _entityList[|0];	
		if (_entityCheck.entityCollision) {
			hSpeed = 0;
			x = round(x);
			vSpeed = 0;
			y = round(y);
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	ds_list_clear(_entityList);
	ds_list_destroy(_entityList);

	//Movement Setup
	var _xCommit = 0;
	var _yCommit = 0;

	//Diagonal Movement
	var _speedWalkReset = speedWalk;
	if (collision == false) {
		if ((hSpeed != 0) && (vSpeed != 0)) {
			hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
			vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);
		}
	}
	else if (collision == true) {
		if ((hSpeed !=0) || (vSpeed !=0)) {
			speedWalk = _speedWalkReset;
		}
	}
	else {
	    speedWalk = _speedWalkReset;
	}
	
	//Non-Free States Movement
	//NOTE:, REMOVE PlayerStateTransition TO REGAIN WALL PASSTHRU
	if ((state != PlayerStateFree)&& state != PlayerStateTransition) {
		//Clamping x for Pixel Perfection
		if (hSpeed == 0) {
			x = round(x);
		}
		//Clamping y for Pixel Perfection
		if (vSpeed == 0) {
			y = round(y);
		}
		_xCommit = hSpeed;
		_yCommit = vSpeed;
	}
	//Free State Movement
	else {
		//First, Slide Along Diagonal Collisions Immediately Never Setting a 0 hSpeed or 0 vSpeed
		if (TileMeetingPrecise((x + sign(hSpeed)), (y + 0), collisionMap)) {
			collision = true;
			if (!(TileMeetingPrecise((x + sign(hSpeed)), (y + 1), collisionMap))) {
				y += speedWalkCol;
			}
			else if (!(TileMeetingPrecise((x + sign(hSpeed)), (y - 1), collisionMap))) {
				y -= speedWalkCol;
			}
			else if (!(TileMeetingPrecise((x + sign(hSpeed)), (y + 2), collisionMap))) {
				y += speedWalkCol;
			}
			else if (!(TileMeetingPrecise((x + sign(hSpeed)), (y - 2), collisionMap))) {
				y -= speedWalkCol;
			}
		}
		else if (TileMeetingPrecise((x + 0), (y + sign(vSpeed)), collisionMap)) {
			collision = true;
			if (!(TileMeetingPrecise((x + 1), (y + sign(vSpeed)), collisionMap))) {
				x += speedWalkCol;
			}
			else if (!(TileMeetingPrecise((x - 1), (y + sign(vSpeed)), collisionMap))) {
				x -= speedWalkCol;
			}
			else if (!(TileMeetingPrecise((x + 2), (y + sign(vSpeed)), collisionMap))) {
				x += speedWalkCol;
			}
			else if (!(TileMeetingPrecise((x - 2), (y + sign(vSpeed)), collisionMap))) {
				x -= speedWalkCol;
			}
		}
		else {
			//Clamping x for Pixel Perfection
			if (hSpeed == 0) {
				x = round(x);
			}
			//Clamping y for Pixel Perfection
			if (vSpeed == 0) {
				y = round(y);
			}
			_xCommit = hSpeed;
			_yCommit = vSpeed;
		}

		//Then, Handle Hard Collisions
		var _xCol;
		var _yCol;
		if (TileMeetingPrecise(x + hSpeed, y, collisionMap)) {
			while !(TileMeetingPrecise(x + sign(hSpeed), y, collisionMap)) {
				x += sign(hSpeed);
			}
			hSpeed = 0;
			x = round(x);
			_xCol = true;
			collision = true;
			playback = 2;
			speedWalk = speedWalkCol;
		}
		else {
			_xCol = false;
			collision = false;
			playback = 1;
			speedWalk = speedWalkMax;
			_xCommit = hSpeed;
		}
		if (TileMeetingPrecise(x, y + vSpeed, collisionMap)) {
			while !(TileMeetingPrecise(x, y + sign(vSpeed), collisionMap)) {
				y += sign(vSpeed)
			}
			_yCol = true;
			if !(_xCol) {
				vSpeed = 0;
				y = round(y);
				collision = true;
				playback = 2;
				speedWalk = speedWalkCol;
			}
			if ((_xCol) && (_yCol)) {
				vSpeed = 0;
				y = round(y);
				collision = true;
				playback = 2;
				speedWalk = speedWalkCol;
			}
		}
		else {
			_yCol = false;
			if !(_xCol) {
				collision = false;
				playback = 1;
				speedWalk = speedWalkMax;
			}
			_yCommit = vSpeed;
		}

		//Any Speed Pixel Perfect Collision Snap Catch-All
		var _sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
		var _sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
		var _sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
		var _sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
		
		if (TileMeetingPrecise(x, y, collisionMap) && (state != PlayerStateTransition)) {
			var _checker = oPreciseTileChecker;
			var _collisionTerrain = instance_place(x + sign(hSpeed), y, _checker);
			if (hSpeed > 0) {
				x = (_collisionTerrain.bbox_left - 1) - _sprite_bbox_right;
			}
			else if (hSpeed < 0) {
				x = (_collisionTerrain.bbox_right + 1) - _sprite_bbox_left;
			}
			if (vSpeed > 0) {
				y = (_collisionTerrain.bbox_top - 1) - _sprite_bbox_bottom;
			}
			else if (vSpeed < 0) {
				y = (_collisionTerrain.bbox_bottom + 1) - _sprite_bbox_top;
			}
			else {
				_xCommit = 0;
				_yCommit = 0;
			}
		}
	}


	//Move Commit
	if (isLocal){
		if (transitionDoorEnter) {
			x += (_xCommit / 3);
			y += (_yCommit / 3);
		}
		else {
			x += _xCommit;
			y += _yCommit;
		}
	}

}
