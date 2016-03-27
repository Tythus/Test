///ds_grid_list_from_row(grid, row)

var grid = argument0;
var row = argument1;

var list = ds_list_create();

var w = ds_grid_width(grid)
var i;
for (i=0; i<w; i+=1){
    ds_list_add(list, grid[# i, row]);
};

return list;
