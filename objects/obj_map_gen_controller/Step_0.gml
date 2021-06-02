/// @description
#region INFO
/*
 
*/
#endregion

if(keyboard_check_pressed(vk_space)) {
	delete curMap;
	
	curMap = new mapPrefab(50, 50, -1, 45, 5);
	curMap.generateMap();
}