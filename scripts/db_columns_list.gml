///db_columns_list(table)

var table = argument0;

var columns_list = ds_map_find_value( DB_MAP, table+"_columns_list");

return columns_list;
