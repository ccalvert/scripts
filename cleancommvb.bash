pbpaste | sed "s/^\([[:space:]]*\)'[[:space:]]*/\1/g" | fmt -w 76 | sed "s/^\([[:space:]]*\)/\1' /g" | pbcopy
