/// @description Layer Management
//layer_set_visible("Col",false);


//get tiles
var _w = room_width;
var _h = room_height;
var gridW = ceil(_w / TILE_SIZE);
var gridH = ceil(_h / TILE_SIZE);
var _index;

//create grid
global.mp_grid = mp_grid_create(0, 0, gridW, gridH, TILE_SIZE, TILE_SIZE);

//add solid instances to grid (may not work for us)

/*layer_id = layer_get_id();

for (var i=0; i < _w; i++){
	for (var j=0; j < _h; i++){
		if (tilemap_get(layer_id, i, j)){
			mp_grid_add_cell(global.mp_grid, i, j);
		}	
	}
/*}

