pclip | tr "\r\n" "\377" | tr -s "\377" | tr "\377" " " | gclip
