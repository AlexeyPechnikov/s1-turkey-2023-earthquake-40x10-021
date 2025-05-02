#!/bin/sh

touch .nojekyll
git add .nojekyll
git commit -m "Add .nojekyll" || true
git push

for dir in *
do
    [ -d "${dir}" ] || continue
    echo "Found directory ${dir}"
    for path in "${dir}"/*
    do
        echo "\tAdd directory ${path}"
        git add "${path}"
        git commit -m "Add dataset directory ${path}" || true
        git push
    done
    
    #find "${dir}" -path './.*' -prune -o -mindepth 2 -maxdepth 2 -type d -print | sed 's|^\./||' > "${dir}/.listing"
    #git add "${dir}/.listing"
    #git commit -m "Add "${dir}/.listing"" || true
    #git push
done
