///db_get(table, row, column)

var table = argument0
var row = argument1;
var column = argument2;

var rows_list = ds_map_find_value( DB_MAP, table+"_rows_list");
var columns_list = ds_map_find_value( DB_MAP, table+"_columns_list");
var values_grid = ds_map_find_value( DB_MAP, table+"_values_grid");

var yy = ds_list_find_index(rows_list, row);
if yy == -1{
    show_debug_message("'"+string(row)+"' row not found, under the '"+table+"' table.");
    return undefined;
};

var xx = ds_list_find_index(columns_list, column);
if xx == -1{
    show_debug_message("'"+string(column)+"' column not found, under the '"+table+"' table.");
    return undefined;
};

var value = values_grid[# xx, yy];

return value;
