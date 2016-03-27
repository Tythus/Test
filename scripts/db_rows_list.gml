///db_rows_list(table)

var table = argument0;

var rows_list = ds_map_find_value( DB_MAP, table+"_rows_list");

return rows_list;
