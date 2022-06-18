event_inherited()
currentObj = oPlayer;
state = PlayerStateFree;
lastState = state;

collisionMap = "Col";

image_speed = 0;
direction = CARDINAL_DIRECTION.DOWN;

hSpeed = 0;
vSpeed = 0;

mouseAngle = 0;

transitionDoorEnter = false;

speedWalk = 1.0;
speedWalkMax = speedWalk;
speedWalkCol = 0.6;

//Other defined walk speeds go here

spriteWalk = sPlayerWalk; //TODO Add finalized sprite
spriteIdle = sPlayerStand;
localFrame = 0;

//shooting stuff
shootCD = 0;
shootCDMax = 20;
meleeCD = 0;
meleeCDMax = 60;

//Which weapon, 0 or 1
currentGun = 0; //TODO Set current gun when controlling player

//create random ID for player (needed for multiplayer)
randomize();
var choice = irandom_range(1, 10000);
myID = choice;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}
