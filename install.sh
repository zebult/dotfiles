#!/bin/bash

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    # [[ "$f" == ".vim" ]] && \cp -rf "$HOME"/"dotfiles"/".vim"/"userautoload" "$HOME"/"tmp" && continue

    echo "$f"
    ln -snfv "$HOME"/"dotfiles"/"$f" "$HOME"/"$f"
done

# \cp -rf "$HOME"/"dotfiles"/"userautoload" "$HOME"/"tmp"
echo finish🍺
