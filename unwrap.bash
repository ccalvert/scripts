xclip -selection clipboard -o | tr "\r\n" "\377" | tr -s "\377" | tr "\377" " " | xclip -selection clipboard
