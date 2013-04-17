@echo off
pbpaste | sed "s/^/>/" | pbcopy
