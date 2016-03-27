///db_rows_size(table);

var list = db_rows_list(argument0);
var size = ds_list_size(list);
ds_list_destroy(list);

return size;
