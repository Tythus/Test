///db_find_row(table, pos)

var table = argument0;
var pos = argument1;

var rows_list = ds_map_find_value( DB_MAP, table+"_rows_list");

return rows_list[| pos];
