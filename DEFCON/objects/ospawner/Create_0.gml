timerMax = max((room_speed*10)/global.difficulty,1)*instance_number(oSpawner);
timer = timerMax;
//Instnace to Spawn can be defined in the instance_create event
instanceType = oZombie;