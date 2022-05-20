if(hSpeed>0){
 cardinal = 0;	
} else if(hSpeed<0){
 cardinal = 2;
} else if(vSpeed<0){
 cardinal = 1;	
} else if(vSpeed>0){
 cardinal = 3;
} else{
 cardinal = -1;	
}


if(cardinal>=0){
 AnimateNPC(1);	
} else{
 var frame = (floor(image_index/4)*4)+1;
 image_index = frame;
}
