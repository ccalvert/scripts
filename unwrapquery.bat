@ECHO OFF

REM This script takes an SQL query in Charles Calvert's usual formatting style and unwraps it to a single line.

REM Command: sed "/--/d"	Deletes comment lines
REM Command: tr \r \040	Replaces LF with a space
REM Command: tr \n \040	Replaces CR with a space
REM Command: tr \011 \040	Replaces tabs with a space
REM Command: tr -s \040	Reduces any occurances of multiple spaces to a single space
REM Command: sed "s/ ,/,/g"	Removes any spaces before a comma
REM Command: sed "s/( /(/g"	Removes any spaces after an opening parenthesis
REM Command: sed "s/ )/)/g"	Removes any spaces before a closing parenthesis

pclip | sed "/--/d" | tr \r \040 | tr \n \040 | tr \011 \040 | tr -s \040 | sed "s/ ,/,/g" | sed "s/( /(/g" | sed "s/ )/)/g" | gclip