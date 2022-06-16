METHOD_EVENT;

xscale = choose(-1, 1);
hp = 3;

attackRange = 72;
resetState = false;

hspd = 0;
walkSpd = 1;

currStateDuration = 0;

spritesDatabase = {};
stateDuration   = {};
input = {}; init_input();
localFrame = 0;

fsm = noone;
