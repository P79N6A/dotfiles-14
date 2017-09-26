# **Shell Commands Cheat Sheet**
~~~

set -e          # Exit as soon as any line in the bash script fails
set -x          # Prints each command executed (prefix with ++)
set -ex         # Do both (for good practice)

-r file     # Check if file is readable.
-w file     # Check if file is writable.
-x file     # Check if we have execute access to file.
-f file     # Check if file is an ordinary file (not a directory, a device file, etc.)
-s file     # Check if file has size greater than 0.
-d file     # Check if file is a directory.
-e file     # Check if file exists.  Is true even if file is a directory.

!     #not
-a    #and
-o    #or

pgm > file     #Output of pgm is redirected to file.
pgm < file     #Program pgm reads its input from file.
pgm >> file    #Output of pgm is appended to file.
pgm1 | pgm2    #Output of pgm1 is piped into pgm2 as the input to pgm2.
n > file       #Output from stream with descriptor n redirected to file.
n >> file      #Output from stream with descriptor n appended to file.
n >& m         #Merge output from stream n with stream m.
n <& m         #Merge input from stream n with stream m.
<< tag         #Standard input comes from here through next tag at start of line.

$0             #Name of this shell script itself.
$1             #Value of first command line parameter (similarly $2, $3, etc)
$#             #In a shell script, the number of command line parameters.
$*             #All of the command line parameters.
$-             #Options given to the shell.
$?             #Return the exit status of the last command.
$$             #Process id of script (really id of the shell running the script)

*              #Matches 0 or more characters.
?              #Matches 1 character.
[AaBbCc]       #Example: matches any 1 char from the list.
[^RGB]         #Example: matches any 1 char not in the list.
[a-g]          #Example: matches any 1 char from this range.

\c             #Take character c literally.
`cmd`          #Run cmd and replace it in the line of code with its output.
"whatever"     #Take whatever literally, after first interpreting $, `...`, \
'whatever'     #Take whatever absolutely literally.

match=`ls *.bak`        #Puts names of .bak files into shell variable match.
echo \*                 #Echos * to screen, not all filename as in:  echo *
echo '$1$2hello'        #Writes literally $1$2hello on screen.
echo "$1$2hello"        #Writes value of parameters 1 and 2 and string hello.

NUMBERS="1 2 3"
for number in `echo $NUMBERS`
do
  echo $number
done
for number in $NUMBERS
do
  echo -n $number
done
for number in 1 2 3
do
  echo -n $number
done

* / %       #(times, divide, remainder)
+ -         #(add, subtract)
< > <= >=   #(the obvious comparison operators)
== !=       #(equal to, not equal to)
&&          #(logical and)
||          #(logical or)
=           #(assignment)

#              #At start of line, indicates a comment.
$var           #Value of shell variable var.
${var}abc      #Example: value of shell variable var with string abc appended.
var=value      #Assign the string value to shell variable var.
cmd1 && cmd2   #Run cmd1, then if cmd1 successful run cmd2, otherwise skip.
cmd1 || cmd2   #Run cmd1, then if cmd1 not successful run cmd2, otherwise skip.
cmd1; cmd2     #Do cmd1 and then cmd2.
cmd1 & cmd2    #Do cmd1, start cmd2 without waiting for cmd1 to finish.
(cmds)         #Run cmds (commands) in a subshell.
~~~
