# This script takes an SQL query in Charles Calvert's usual formatting style and unwraps it to a single line.

# Command: sed "/--/d"	Deletes comment lines
# Command: tr \r \040	Replaces LF with a space
# Command: tr \n \040	Replaces CR with a space
# Command: tr \011 \040	Replaces tabs with a space
# Command: tr -s \040	Reduces any occurances of multiple spaces to a single space
# Command: sed "s/ ,/,/g"	Removes any spaces before a comma
# Command: sed "s/( /(/g"	Removes any spaces after an opening parenthesis
# Command: sed "s/ )/)/g"	Removes any spaces before a closing parenthesis

xclip -selection clipboard -o | sed "/--/d" | tr \r \040 | tr \n \040 | tr \011 \040 | tr -s \040 | sed "s/ ,/,/g" | sed "s/( /(/g" | sed "s/ )/)/g" | xclip -selection clipboard
