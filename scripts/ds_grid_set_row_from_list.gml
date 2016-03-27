///ds_grid_set_row_from_list( grid, x, y, list)

var grid = argument0;
var xx = argument1;
var yy = argument2;
var list = argument3;

var w = ds_list_size(list);

var i;
for (i=0; i<w; i+=1){
    grid[# xx+i, yy] = list[| i];
};
