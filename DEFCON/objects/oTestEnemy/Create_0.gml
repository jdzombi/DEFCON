event_inherited();

mask_index = sEnemyTest;

sprites_database_init("sEnemy", [
	["idle",			"Test"			],
	["walk",			"Test"			],
]);



input = {}; init_input();

//hurtbox = hurtbox_create(id, sEnemyTest);
hurtbox = hurtbox_create(id, sEnemyTestMask); //TODO make hurtbox
hitbox = noone;
    
fsm = new SnowState("idle");
fsm
    .event_set_default_function("draw", function() {
		
		
    	//draw_sprite_scaled(sprite_index, image_index, x, y, image_xscale, image_yscale);
    	
    	//var _w = 50, _h = 3;
    	//var _x = x-_w/2, _y = y-65;
    	//draw_healthbar(_x, _y, _x+_w, _y+_h, hp/3*100, c_black, c_red, c_green, 0, false, true);
    })
	.add("idle", {
		enter: function() {
			state_init();
			//hspd = 0;
		},
		step: function() {
			// Change state
			if (true) return fsm.change("walk");
		}
	})
	.add("walk", {
		enter: function() {
			state_init();
           // if (abs(input.hdir)) xscale = input.hdir;
		},
		step: function() {
			//set_horizontal_motion(walkSpd);
			x++;
			// Change state
			//if (!abs(input.hdir)) return fsm.change("idle");

		}
	})
	.add("choose_state", {
		enter: function() {
			//input.hdir = point_direction(x, y, oPlayer.x , oPlayer.y);
			input.hdir = choose(-1,1);
		}
	})
	.add("attack", {
		enter: function() {
			state_init();
			hspd = 0;
			
	        hitbox = hitbox_create(sEnemyTest, id, xscale,
				[oPlayer], function(_inst) {
					_inst.hit(1, ATTACK_TYPE.MELEE);
		        }
			);
		},
		step: function() {
			if (animation_end()) {
				return fsm.change(input.attackP ? "attack" : "idle");
			}
		},
		leave: function() {
			hitbox = instance_destroy_safe(hitbox);
		}
	})
	.add("dead", {
    	enter: function() {
			hspd = 0;
    		state_init();
    	},
    	step: function() {
    		if (animation_end()){
				
				instance_destroy();
				
			}
    	}
    });
    
//enemy stats
hp = 10;
