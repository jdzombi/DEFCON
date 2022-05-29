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
var lay_id = layer_get_id("Col");
var tile_id = layer_tilemap_get_id(lay_id);

for (var i=23; i < 28; i++){
	for (var j=16; j < 19; j++){
		// if (tilemap_get(tile_id, i*TILE_SIZE, j*TILE_SIZE) =! -1) {
        //    mp_grid_add_cell(global.mp_grid, i, j);
        // }
		mp_grid_add_cell(global.mp_grid, i, j);
	}
}
