@echo off
pbpaste | sed "s/     />/g" | pbcopy
