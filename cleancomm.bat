pclip | sed "s/^\([[:space:]]*\)\/\/ /\1/" | fmt --width=85 | sed "s/^\([[:space:]]*\)/\1\/\/ /g" | gclip
