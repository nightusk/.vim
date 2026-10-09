[windows]
set shell := ["powershell.exe", "-NoLogo", "-Command"]

[linux]
init:
    git switch main

[windows]
init:
    if (-not (Test-Path -Path $env:USERPROFILE/vimfiles)) { git worktree add $env:USERPROFILE/vimfiles }
    if (-not (Test-Path -Path $env:LOCALAPPDATA/nvim))    { git worktree add $env:LOCALAPPDATA/nvim }
