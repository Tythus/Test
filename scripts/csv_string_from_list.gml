///csv_string_from_list(list)

var list = argument0;

var str = "";
var length = ds_list_size(list);

var i, value;
for (i=0; i<length; i+=1){
    value = ds_list_find_value(list, i);
    value = string(value);
    
    if string_count(CSV_DELIM, value)     value = CSV_QUOTE+value+CSV_QUOTE;
    
    str += value;
    
    if i != length-1{
        str += CSV_DELIM
    }
};

return str;
