/*//	MAP PREFAB CREATOR
////	Data struct that holds the settings for the generation.
*///	These can be created / saved for diffrent biomes or generation types.

function mapPrefab(_width, _height, _seed, _randPersent, _smoothCount) constructor {
	log("Building prefab");
	
	width			= _width;
	height			= _height;
	seed			= _seed	
	grid			= ds_grid_create(_width, _height);	
	randomPersent	= clamp(_randPersent, 0, 100);
	smoothCount		= _smoothCount
	
	if (_seed = -1) {
		seed = irandom_range(-9999999, 9999999);	
	}
	
	static generateMap = function() {
		randomFillMap();	
		
		for (var i = 0; i < smoothCount; ++i) {
		    smoothMap();
		}
	}
	
	static randomFillMap = function() {
		log("Starting random fill script......");
		random_set_seed(seed);
		
		//returns 0 or 1 based on randomPersent var
		static randomSetCell = function() { 
			var rand = irandom_range(0, 100);
			return(rand < randomPersent);
		}
		
		for (var _y = 0; _y < height; ++_y) {
		    for (var _x = 0; _x < width; ++_x) {
				if (_x == 0 || _x == width-1 || _y == 0 || _y == height-1) {
					grid[# _x, _y] = 1;
				} else {
					grid[# _x, _y] = randomSetCell();
				}
			}
		}
		log("'RandomFillMap' script finished......");
	}
		
	static smoothMap = function() {
		
		static getWallCount = function(_x, _y) {
			var count = 0// ds_grid_get_sum(grid, _x-1, _y-1, _x+1, _y+1);
			
			for (var neighbourX = (_x-1); neighbourX <= (_x+1); ++neighbourX) {
			    for (var neighbourY = (_y-1); neighbourY <= (_y+1); ++neighbourY) {
					if(neighbourX >= 0 && neighbourX < width  && neighbourY >= 0 && neighbourY < height) {
						if (neighbourX!= _x || neighbourY != _y) {
							count += grid[# neighbourX, neighbourY];
						}
					} else {
						count ++;	
					}
				}
			}
			
			return(count);
		}
		
		for (var _y = 0; _y < height; ++_y) {
		    for (var _x = 0; _x < width; ++_x) {
				var neighbourWalls = getWallCount(_x, _y);
				
				if (neighbourWalls > 4) {
					grid[# _x, _y] = 1	
				} else if (neighbourWalls < 4) { 
					grid[# _x, _y] = 0	
				}
			}
		}
	}
	
	static drawMapGizmos = function() {
		for (var _y = 0; _y < height; ++_y) {
		    for (var _x = 0; _x < width; ++_x) {
				var _is_wall = grid[# _x, _y];
				draw_set_color(_is_wall? c_white : c_black);
				draw_rectangle(10 + (_x*5), 10 + (_y*5), 12 + (_x*5), 12 + (_y*5), _is_wall);
				
			}
		}	
		draw_set_color(c_white);
	}
	
}

//Basic log function

function log(_string) {
	show_debug_message(_string);	
}