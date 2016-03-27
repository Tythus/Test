///db_filter_rows_list( list, table, ["column==", filter_value], ["column>", filter_value], ..)

/***************************************************
  Takes a list of rows and returns a returns a copy with only those rows
  which passes the filters given as arguments.
  
  It is useful for further filtering a list of rows previously filtered using db_filter_rows
  
  argument[0] is the ds_list you wish to filter. The list should contain a number of rows from a single table in the database.
  argument[1] is the table that the rows are from.
    
  agument[2-15] are optional filtering rules and must be given in pairs.
    
  Rules are given in pairs, with the first argument consisting of the name of a column and an operator, for example "attack>=" or "name==".
  The second argument in a rule-pair is the value to check against.

  Example:
  bitterSweetRedFruitsList = db_rows_filter_list( redFruitsList, "fruit", "sweetness>", 5, "bitterness>", 5,);
  //Takes a list of rows from the fruits table and returns a new list with only the fruits for which the "sweetness" and "bitterness" columns have values above 5.
 ***************************************************/

var list = argument[0];
var table = argument[1];

var i, column, operator, filter, str;
for (i=2; i<argument_count; i+=2){
    j = floor(i/2)-1;
    str = argument[i];
    if string_count("==", str) operator[j] = "==";
    else if string_count(">=", str) operator[j] = ">=";
    else if string_count(">", str)  operator[j] = ">";    
    else if string_count("<=", str) operator[j] = "<=";
    else if string_count("<", str)  operator[j] = "<";    
    else if string_count("!=", str)  operator[j] = "!=";
    else if string_count("=", str)  operator[j] = "==";    
    
    column[j] = string_replace(str, operator[j], "");
    filter[j] = argument[i+1];
};
var filter_count = j+1;

var result_list = ds_list_create();

var size = ds_list_size(list);
var i, row, value;
for (i=0; i<size; i+=1){
    row = list[| i];
    pass = false;
    for (j=0; j<filter_count; j+=1){
        value = db_get( table, row, column[j] );
//        value = string(value);
//        filter[j] = string(filter[j]);
        switch (operator[j]){
            case "==": if value == filter[j] pass = true; break;
            case ">=": if value >= filter[j] pass = true; break;
            case ">": if value > filter[j] pass = true; break;
            case "<=": if value <= filter[j] pass = true; break;
            case "<": if value < filter[j] pass = true; break;            
            case "!=": if value != filter[j] pass = true; break;            
            default: show_debug_message("Operator not recognized in db_rows_filter_list: "+operator[j] );
        };
        if not pass break;
    };
    if pass ds_list_add( result_list, row);
};

return result_list;
