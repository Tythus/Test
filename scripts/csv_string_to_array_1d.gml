///csv_string_to_list(str)
/***************************************************
  Takes a string with comma seperated values and returns the value in a 1d array
  Vertical bars are used as quotation around string with coommas in them likke so: |string with , in it|
  Values are converted to a real or string as appropriate before being put in the list
 ***************************************************/
var str, length, value, quote_column, i, char, array;

str = argument0;

length = string_length(str);
count = 0;

value = "";
quote_column = "";
for (i=1; i<=length; i+=1){ //Loop through string adding one character at a time to value, adding the value to the list at every seperator
    char = string_char_at(str, i);
    if char == CSV_QUOTE{ //Check for charcters used to enclose quoute_columns
        if quote_column == ""            quote_column = char;
        else if char == quote_column     quote_column = "";
        else                            value += char;    
    };
    else if quote_column == "" and char == CSV_DELIM{
        value = string_to_real_or_string(value);
        array[count] = value; count ++;
        value = "";
    };
    else value += char;
};
value = string_to_real_or_string(value);
array[count] = value;

return array;
