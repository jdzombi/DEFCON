METHOD_EVENT;

xscale = choose(-1, 1);
hp = 3;

attackRange = 72;
resetState = false;

hspd = 0;
vspd = 0;
vspdMax = 10;
grav = 1;
walkSpd = 1;

currStateDuration = 0;

spritesDatabase = {};
stateDuration   = {};
input = {}; init_input();

fsm = noone;
