xclip -selection clipboard -o | sed "s/^'\*\*[ ]*//g" | fmt -w 77 | sed "s/^/'\*\* /g" | xclip -selection clipboard
