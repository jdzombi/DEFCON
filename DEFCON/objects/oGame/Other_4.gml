/// @description Layer Management
//layer_set_visible("Col",false);


//get tiles
var gridW = ceil(room_width / TILE_SIZE);
var gridH = ceil(room_width / TILE_SIZE);

//create grid
global.mp_grid = mp_grid_create(0, 0, gridW, gridH, TILE_SIZE, TILE_SIZE);

//add solid instances to grid (may not work for us)
mp_grid_add_instances(global.mp_grid, oPreciseTileChecker, false);

