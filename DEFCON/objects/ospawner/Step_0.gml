timerMax = max((room_speed*10)/global.difficulty,1)*instance_number(oSpawner);
timer--;

if(timer<=0 && instance_number(oZombie)<global.enemyCountMax){
instance_create(x,y,instanceType);
timer=timerMax;
}