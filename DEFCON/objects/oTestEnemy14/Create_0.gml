event_inherited();


collisionMap = "Col"
//enemy stats
hp = 10;

state = CheckForPlayer;
xscale = 1;
moveSpeed = 0.5;


hspd = 0;
vspd = 0;
mask_index = sEnemyTest;
hurtbox = hurtbox_create(id, sEnemyTestMask);

alert = false;

//create ai pathing
path = path_add();

