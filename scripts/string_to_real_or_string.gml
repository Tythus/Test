///string_to_real_or_string(string);
/***************************************************
  Checks if the input is a number or a text-string
  and returns either a real or a string accordingly
 ***************************************************/
 
var input = argument0;

if input == "0" return 0;

var num = real(input); //real(string) returns 0 for non-number strings, except where the first char is a number (it then returns numbers until non numbers);
if num == 0 return input;

var integer = floor(num);

var pointPos = string_pos(".", input);
var integerString = input;
if pointPos{
    integerString = string_copy(input, 1, pointPos-1);
}

//show_debug_message("integerString="+integerString);
//show_debug_message("string(integer)="+string(integer));

if integerString == string(integer) return num;
else return input;
