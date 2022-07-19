event_inherited();

sIdle = sGreenIdle;
sWalk = sGreenWalk;
sAttack = sGreenAttack;
xRand = irandom_range(0,20)-10;
yRand = irandom_range(0,20)-10;
collisionMap = "Col"
//enemy stats
hp = 10;

state = Idle;
xscale = 1;
moveSpeed = 0.5;

lastCheckedDistance = 0;
lastCheckedX = 0;
lastCheckedY = 0;

hspd = 0;
vspd = 0;
mask_index = sEnemyTest;
hurtbox = hurtbox_create(id, sEnemyTestMask);
hitbox = noone;

alert = false;
target = noone;
targetCD = 0;
targetCDMax = 1200;


//create ai pathing
path = path_add();

//set delay for calculating path (saves on cpu)
calcPathDelay = 2 * room_speed;
//set timer for calculating path (wake-up time)
calcPathTimer = irandom(30);

depth = -bbox_bottom;