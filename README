Generates caves from custom prefabs that save generation settings.

With prefabs you can save the generation style.
So you could do;

```
caveGen		 = new mapPrefab(100, 100, -1, 45, 2);
forestGen	 = new mapPrefab(50, 50, -1, 30, 3);
```  
Keeping the seed as -1 means it will generate a new seed each run.
Now you can just do this to generate the map;
```
curMap = caveGen;
curMap.generateMap();
```
  
You can also save the seed if you find a seed you like 
and want to save it for a demo, or see how different 
generation setting affect the same seed.
You just have to change the seed from -1, to the selected seed, like this;

```
demoCaveGen = new mapPrefab(100, 100, 738465, 45, 2);
```
to access the maps grid all you have to do is;
```
curMap.grid[# _x, _y];
``` 
Or you could set up a macro like;
```
#macro curGrid curMap.grid
```  
Now when you want to access the grid you can do;
```
curGrid[# _x, _y];
```
