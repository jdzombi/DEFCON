event_inherited();


collisionMap = "Col"
//enemy stats
hp = 10;

state = Idle;
xscale = 1;
moveSpeed = 0.5;


hspd = 0;
vspd = 0;
mask_index = sEnemyTest;
hurtbox = hurtbox_create(id, sEnemyTestMask);

alert = false;

//create ai pathing
path = path_add();

//set delay for calculating path (saves on cpu)
calcPathDelay = 3;
//set timer for calculating path (wake-up time)
calcPathTimer = irandom(30);