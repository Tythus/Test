///db_set(table, row, column, value)

/***************************************************
  Adds or replaces value in database DB_MAP,
  creating new table, row, and column if they do not exist
 ***************************************************/

var table = argument0;
var row = argument1;
var column = argument2;
var value = argument3;

var new_table = false;
if not ds_map_exists( DB_MAP, table+"_values_grid"){
    ds_map_add( DB_MAP, table+"_rows_list", ds_list_create());
    ds_map_add( DB_MAP, table+"_columns_list", ds_list_create());
    ds_map_add( DB_MAP, table+"_values_grid", ds_grid_create(1,1));
    new_table = true;
    if DB_DEBUG_MODE show_debug_message("'"+table+"' table added to database");
};
var rows_list = ds_map_find_value( DB_MAP, table+"_rows_list");
var columns_list = ds_map_find_value( DB_MAP, table+"_columns_list");
var values_grid = ds_map_find_value( DB_MAP, table+"_values_grid");

var yy = ds_list_find_index(rows_list, row);
if yy == -1{
    ds_list_add(rows_list, row);
    if not new_table ds_grid_resize(values_grid, ds_grid_width(values_grid), ds_grid_height(values_grid)+1);
    if DB_DEBUG_MODE show_debug_message(string(row)+" row added to database, under the '"+table+"' table.");
    yy = ds_list_find_index(rows_list, row);
};

var xx = ds_list_find_index(columns_list, column);
if xx == -1{
    ds_list_add(columns_list, column);
    if not new_table ds_grid_resize(values_grid, ds_grid_width(values_grid)+1, ds_grid_height(values_grid));
    if DB_DEBUG_MODE show_debug_message(string(column)+" column added to database, under the '"+table+"' table.");
    xx = ds_list_find_index(columns_list, column);
};

ds_grid_set( values_grid, xx, yy, value);
if DB_DEBUG_MODE show_debug_message(string(table)+", "+string(row)+", "+string(column) +" set to "+string(value));
