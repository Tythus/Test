///db_write_csv(table, [fname])

var table = argument[0];
var fname = table +".csv";
if argument_count == 2 fname = argument[1]

var rows_list = ds_map_find_value( DB_MAP, table+"_rows_list");
var columns_list = ds_map_find_value( DB_MAP, table+"_columns_list");
var values_grid = ds_map_find_value( DB_MAP, table+"_values_grid");

w = ds_list_size(columns_list)+1;
h = ds_list_size(rows_list)+1;

var csv_grid = ds_grid_create(w,h);

ds_grid_set_row_from_list( csv_grid, 1, 0, columns_list);
ds_grid_set_col_from_list( csv_grid, 0, 1, rows_list);
ds_grid_set_grid_region( csv_grid, values_grid, 0, 0, w-1, h-1, 1, 1);

csv_write_from_grid( csv_grid, fname);

ds_grid_destroy(csv_grid);
