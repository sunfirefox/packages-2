--TEST--
Test mb_ereg_replace() function : usage variations  
--SKIPIF--
<?php
extension_loaded('mbstring') or die('skip');
function_exists('mb_ereg_replace') or die("skip mb_ereg_replace() is not available in this build");
?> 
--FILE--
<?php
/* Prototype  : proto string mb_ereg_replace(string pattern, string replacement, string string [, string option])
 * Description: Replace regular expression for multibyte string 
 * Source code: ext/mbstring/php_mbregex.c
 * Alias to functions: 
 */

echo "*** Testing mb_ereg_replace() : usage variations ***\n";

// Initialise function arguments not being substituted (if any)
$pattern = '[a-k]';
$replacement = '1';
$string = 'string_val';

//get an unset variable
$unset_var = 10;
unset ($unset_var);

// get a class
class classA
{
  public function __toString() {
    return "UTF-8";
  }
}

// heredoc string
$heredoc = <<<EOT
UTF-8
EOT;

// get a resource variable
$fp = fopen(__FILE__, "r");

// unexpected values to be passed to $encoding argument
$inputs = array(

       // int data
/*1*/  0,
       1,
       12345,
       -2345,

       // float data
/*5*/  10.5,
       -10.5,
       12.3456789000e10,
       12.3456789000E-10,
       .5,

       // null data
/*10*/ NULL,
       null,

       // boolean data
/*12*/ true,
       false,
       TRUE,
       FALSE,
       
       // empty data
/*16*/ "",
       '',

       // string data
/*18*/ "UTF-8",
       'UTF-8',
       $heredoc,
       
       // object data
/*21*/ new classA(),

       // undefined data
/*22*/ @$undefined_var,

       // unset data
/*23*/ @$unset_var,

       // resource variable
/*24*/ $fp
);

// loop through each element of the array for pattern

$iterator = 1;
foreach($inputs as $input) {
      echo "\n-- Iteration $iterator --\n";
      var_dump( mb_ereg_replace($pattern, $replacement, $string, $input) );
      $iterator++;
};

fclose($fp);
echo "Done";
?>
--EXPECTF--
*** Testing mb_ereg_replace() : usage variations ***

-- Iteration 1 --
string(10) "str1n1_v1l"

-- Iteration 2 --
string(10) "str1n1_v1l"

-- Iteration 3 --
string(10) "str1n1_v1l"

-- Iteration 4 --
string(10) "str1n1_v1l"

-- Iteration 5 --
string(10) "str1n1_v1l"

-- Iteration 6 --
string(10) "str1n1_v1l"

-- Iteration 7 --
string(10) "str1n1_v1l"

-- Iteration 8 --
string(10) "str1n1_v1l"

-- Iteration 9 --
string(10) "str1n1_v1l"

-- Iteration 10 --
string(10) "str1n1_v1l"

-- Iteration 11 --
string(10) "str1n1_v1l"

-- Iteration 12 --
string(10) "str1n1_v1l"

-- Iteration 13 --
string(10) "str1n1_v1l"

-- Iteration 14 --
string(10) "str1n1_v1l"

-- Iteration 15 --
string(10) "str1n1_v1l"

-- Iteration 16 --
string(10) "str1n1_v1l"

-- Iteration 17 --
string(10) "str1n1_v1l"

-- Iteration 18 --
string(10) "str1n1_v1l"

-- Iteration 19 --
string(10) "str1n1_v1l"

-- Iteration 20 --
string(10) "str1n1_v1l"

-- Iteration 21 --
string(10) "str1n1_v1l"

-- Iteration 22 --
string(10) "str1n1_v1l"

-- Iteration 23 --
string(10) "str1n1_v1l"

-- Iteration 24 --

Warning: mb_ereg_replace() expects parameter 4 to be string, resource given in %s on line %d
bool(false)
Done