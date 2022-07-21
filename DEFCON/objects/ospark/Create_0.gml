image_speed = .7;
if(instance_exists(oPlayer)) depth = oPlayer.depth;
instOwner = instance_nearest(x,y,oPlayer);
image_angle = (point_direction(x, y, instOwner.x, instOwner.y))-45;
