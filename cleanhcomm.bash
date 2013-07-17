xclip -selection clipboard -o | sed "s/^\*\*[ ]*//g" | fmt -w 80 | sed "s/^/\*\* /g" | xclip -selection clipboard
