xclip -o | sed "s/^\([[:space:]]*\)\/\/ /\1/" | fmt -w 85 | sed "s/^\([[:space:]]*\)/\1\/\/ /g" | xclip
