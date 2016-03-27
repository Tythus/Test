///db_row_delete(table, row)

var table = argument0;
var row = argument1;

var rows_list = ds_map_find_value( DB_MAP, table+"_rows_list");
var values_grid = ds_map_find_value( DB_MAP, table+"_values_grid");

var yy = ds_list_find_index(rows_list, row);
if yy == -1{
    show_debug_message(row +" not found in "+table+" (for deletion)");
    exit;
};

var w = ds_grid_width(values_grid);
var h = ds_grid_height(values_grid);
ds_grid_set_grid_region(values_grid, values_grid, 0, yy+1, w, h, 0, yy);
ds_grid_resize(values_grid, w, h-1);

ds_list_delete(rows_list, yy);
