/// @description Layer Management
//layer_set_visible("Col",false);


//get tiles
var _w = room_width;
var _h = room_height;
var gridW = ceil(_w / TILE_SIZE);
var gridH = ceil(_h / TILE_SIZE);

//create grid
global.mp_grid = mp_grid_create(0, 0, gridW, gridH, TILE_SIZE, TILE_SIZE);

//add solid instances to grid (may not work for us)
var lay_id = layer_get_id("Col");
var tile_id = layer_tilemap_get_id(lay_id);

for (var i=0; i<_w; i+=TILE_SIZE){
	for (var j=0; j<_h; j+=TILE_SIZE){
		if (tilemap_get_at_pixel(tile_id, i, j)){
			mp_grid_add_cell(global.mp_grid, i/TILE_SIZE, j/TILE_SIZE);	
		}
	}
}

