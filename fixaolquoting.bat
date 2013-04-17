@echo off
pclip | sed "s/     />/g" | gclip
