event_inherited();


collisionMap = "Col"
//enemy stats
hp = 10;
state = CheckForPlayer;
xscale = 1;
moveSpeed = 1;
hspd = 0;
vspd = 0;
mask_index = sEnemyTest;
hurtbox = hurtbox_create(id, sEnemyTestMask);


alert = false;
alert_dis = 160;

//create ai pathing
path = path_add();

