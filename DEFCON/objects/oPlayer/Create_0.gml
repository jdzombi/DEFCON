event_inherited()
currentObj = oPlayer;
state = PlayerStateFree;
lastState = state;
hitbox = noone;
hurtbox = hurtbox_create(id, sEnemyTestMask);
collisionMap = "Col";

image_speed = 0;
direction = CARDINAL_DIRECTION.DOWN;

hSpeed = 0;
vSpeed = 0;

hpMax = 3;
hp = hpMax;
invincibilityTimerMax = room_speed * 2;
invincibilityTimer = 0;
hpRegenCoolDownMax = room_speed * 5;
hpRegenCoolDown = hpRegenCoolDownMax;

mouseAngle = 0;

transitionDoorEnter = false;

speedWalk = 1.0;
speedWalkMax = speedWalk;
speedWalkCol = 0.6;

//Other defined walk speeds go here

spriteWalk = sScientistBodyWalk; //TODO Add finalized sprite
spriteIdle = sScientistBodyIdle;

armID = instance_create(x,y,oPlayerArms);
armID.owner = id;
armSpriteIndex = sScientistArmIdle;

armSpriteIdle = sScientistArmIdle;
armSpriteWalk = sScientistArmWalk;
armSpriteReload = sScientistArmReload;
armSpriteShoot = sScientistArmShoot;

localFrame = 0;

//attacking stuff
shootCD = 0;
shootCDMax = .3 * room_speed;
meleeDamage = 1;
meleeCD = 0;
meleeCDMax = .3* room_speed;
meleePlayerStunMax = .1 * room_speed;
meleePlayerStun = 0;
reloadSpeed = 0;
reloadSpeedMax = .8 *room_speed;

playerScore = 0;

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