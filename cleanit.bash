xclip -selection clipboard -o | sed "s/^[>[:space:]]*//g" | fmt -w 70 | sed "s/^/> /g" | xclip -selection clipboard
