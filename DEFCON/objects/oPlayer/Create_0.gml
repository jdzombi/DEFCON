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

spriteWalk = sPlayer; //TODO Add finalized sprite
spriteIdle = sPlayer;
localFrame = 0;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}
