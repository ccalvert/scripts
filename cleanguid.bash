xclip -selection clipboard -o | sed "s/[{}]//g" | sed "s/-/_/g" | xclip -selection clipboard
