#!/bin/bash

for file in testes_publicos/*
do
    if [ -f "$file" ]; then
        ./covid < "$file"
    fi
done

for item in teste[1-5]/*
do
    if [ -f "$item" ]; then
        dir="$(dirname "$item")"
        file="$(basename "$item")"
        mkdir "$dir"/diff 2>/dev/null
        diff "$item" testes_publicos/"$item" > "$dir"/diff/diff_"$file"
    fi
done

for diff_item in teste[1-5]/diff/*
do
    dir="$(dirname "$diff_item")"
    file="$(basename "$diff_item")"
    if [ -s "$diff_item" ]; then
        echo "Atenção: "$file" em "$dir" apresentou problemas."
    fi
done