///ds_grid_list_from_col(grid, col)

var grid = argument0;
var col = argument1;

var list = ds_list_create();

var h = ds_grid_height(grid)
var i;
for (i=0; i<h; i+=1){
    ds_list_add(list, grid[# col, i]);
};

return list;
