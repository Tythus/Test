///db_read_csv(table, [fname])

var table = argument[0];
var fname = table +".csv";
if argument_count == 2 fname = argument[1]

if not file_exists(fname){
    show_error(fname+" does not exist", false);
    exit;
};

var grid = csv_read_to_grid(fname); //Read csv file and store it in a grid
var w = ds_grid_width(grid)-1;
var h = ds_grid_height(grid)-1;

ds_map_replace( DB_MAP, table+"_values_grid", ds_grid_create(w,h)); //Add or replace table in database
if DB_DEBUG_MODE show_debug_message("'"+table+"' table added to database");

//Copy csv grid to database, except first row and column
var values_grid = ds_map_find_value( DB_MAP, table+"_values_grid");
ds_grid_set_grid_region(values_grid, grid, 1, 1, w+1, h+1, 0, 0);

var rows_list = ds_grid_list_from_col(grid, 0); //Get row column from csv grid
ds_list_delete(rows_list, 0); //Delete top left corner value
ds_map_add( DB_MAP, table+"_rows_list", rows_list);//Add to database

var columns_list = ds_grid_list_from_row(grid, 0); //Get columns row from csv grid
ds_list_delete(columns_list,0); //Delete top left corner value
ds_map_add( DB_MAP, table+"_columns_list", columns_list);//Add to database

ds_grid_destroy(grid);
