@echo off
pclip | sed "s/^[>[:space:]]*//g" | fmt --width=70 | sed "s/^/> /g" | gclip
