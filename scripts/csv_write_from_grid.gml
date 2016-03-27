///csv_write_from_grid(grid, fname)

var grid = argument0;
var fname = argument1;

var file = file_text_open_write(fname);

var i, list, str;
var h = ds_grid_height(grid);
for (i=0; i<h; i+=1){
    list = ds_grid_list_from_row( grid, i);
    str = csv_string_from_list(list);
    file_text_write_string(file, str);
    if (i != h-1) file_text_writeln(file);
    ds_list_destroy(list);
};

file_text_close(file);
