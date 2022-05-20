collision = false;

//Object we are currently moving
currentObj = noone;
movementBehavior = MOVEMENT_BEHAVIOR.CHECK_CONTINUALLY;

//Gamepad Support
global.currentGamepadDevice = -1;
isGamepadConnected = false;

//Input Vars
inputKeyDirectionLeft = 0;
inputKeyDirectionRight = 0;
inputKeyDirectionUp = 0;
inputKeyDirectionDown = 0;
inputKeyButtonA = 0; //A on XBOX //Z on Keyboard //CROSS on PS4   
inputKeyButtonB = 0; //B on XBOX //X on Keyboard //CIRCLE on PS4  
inputKeyButtonX = 0; //X on XBOX //V on Keyboard //SQUARE on PS4  
inputKeyButtonY = 0; //Y on XBOX //C on Keyboard //TRIANGLE on PS4
inputKeyButtonSelect = 0; //VIEW on XBOX //TAB on Keyboard //SHARE on PS4
inputKeyButtonStart = 0; //MENU on XBOX //ESC on Keyboard //OPTIONS on PS4

//Ancillary Vars
allowContinualMashInputKeyButtonB = false;
stickHoldFramesTimerReset = 20;
stickHoldFramesTimer = stickHoldFramesTimerReset;
gateMimicDPadLeft = false;
gateMimicDPadRight = false;
gateMimicDPadUp = false;
gateMimicDPadDown = false;
