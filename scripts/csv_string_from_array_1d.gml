///db_csv_string_from_array_1d(arra, [)

var array = argument0;

var str = "";
var length = array_length_1d(array);

var i, value;
for (i=0; i<length; i+=1){
    value = string(array[i]);
    
    if string_count(CSV_DELIM, value)     value = CSV_QUOTE+value+CSV_QUOTE;
    
    str += value;
    
    if i != length-1{
        str += CSV_DELIM;
    }
};

return str;
