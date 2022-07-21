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
shootCDMax = .3 * room_speed;
meleeCD = 0;
meleeCDMax = .5* room_speed;
reloadSpeed = 0;
reloadSpeedMax = .8 *room_speed;

//Which weapon, 0 or 1
currentGun = 0; //TODO Set current gun when controlling player

//bool to show gunUI
if(instance_exists(oUIController))oUIController.combatUI = true;

//local or client
isLocal = true;
playerID = -1;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}