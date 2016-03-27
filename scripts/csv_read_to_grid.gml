///csv_read_to_grid(fname)

var fname = argument0;

if not file_exists(fname){
    show_error(fname+" does not exist", false);
    exit;
};

var file = file_text_open_read(fname);

rows_list = ds_list_create();

var str, row;
while (true){
    str = file_text_read_string(file);
    row = csv_string_to_list(str);
    ds_list_add(rows_list, row);
    
    if file_text_eof(file) break;
    else file_text_readln(file);
};
file_text_close(file);

var w = ds_list_size(ds_list_find_value(rows_list, 0));
var h = ds_list_size(rows_list);

var grid = ds_grid_create(w,h);

var xx, yy, value;
for (yy=0; yy<h; yy+=1){
    row = ds_list_find_value(rows_list, yy);
    for (xx=0; xx<w; xx+=1){
        value = ds_list_find_value(row, xx);
        ds_grid_add(grid, xx, yy, value);
    };
    ds_list_destroy(row);
};
ds_list_destroy(rows_list);

return grid;
