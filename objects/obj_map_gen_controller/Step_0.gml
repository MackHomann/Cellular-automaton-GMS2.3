/// @description
#region INFO
/*
 
*/
#endregion

if(keyboard_check_pressed(vk_space)) {
	delete curMap;
	
	curMap = openCaveGen;
	curMap.generateMap();
}