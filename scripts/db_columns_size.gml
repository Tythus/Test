///db_columns_size(table);

var list = db_columns_list(table);
var size = ds_list_size(list);
ds_list_destroy(list);

return size;
