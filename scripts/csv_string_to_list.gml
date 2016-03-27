///csv_string_to_list(str)
/***************************************************
  Takes a string with comma seperated values and returns the value in ds_list
  Vertical bars are used as quotation around string with coommas in them likke so: |string with , in it|
  Values are converted to a real or string as appropriate before being put in the list
 ***************************************************/
var str, length, value, quote_column, i, char, list;

str = argument0;
list = ds_list_create();

length = string_length(str);
value = "";
quoteField = false;
for (i=1; i<=length; i+=1){ //Loop through string adding one character at a time to value, adding the value to the list at every seperator
    char = string_char_at(str, i);
    if char == CSV_QUOTE{ //Check for charcters used to enclose quoute_columns
        quoteField = !quoteField;
    };
    else if not quoteField and char == CSV_DELIM{
        value = string_to_real_or_string(value);
        ds_list_add(list, value);
        value = "";
    };
    else value += char;
};
value = string_to_real_or_string(value);
ds_list_add(list, value);

return list;
