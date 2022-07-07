timer--;

if(timer<=0 && instance_number(oZombie)<global.enemyCountMax){
instance_create(x,y,instanceType);
timer=timerMax;
}