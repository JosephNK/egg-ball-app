#!/bin/bash
(
  cd packages/resource/

  while getopts d:f: flag
  do
    case "${flag}" in
        d) search_dir=${OPTARG};; # search_dir=assets/images/svg
        f) force=${OPTARG};; # true/false
    esac
  done

  if [ "$force" == "true" ]
  then
    echo "Reset Convert remove .vec all file"
    for entry in "$search_dir"/*
    do
      if [[ -f "$entry.vec" ]]; then
        rm "$entry.vec"
      fi
    done
  fi

  if [ -z "$search_dir" ]
  then
    echo "Do must use -d flag"
  else
    for entry in "$search_dir"/*
    do
      if [[ -f "$entry.vec" ]] || [[ $entry == *".vec"* ]]; then
        echo "Pass File :: $entry"
        continue
      fi
      if [[ $entry != *".vec"* ]] ; then
        echo "PreCompiling and Optimizing SVGs ($entry to $entry.vec)"
        vector_graphics_compiler -i "$entry" -o "$entry.vec" --no-optimize-masks --no-optimize-clips --no-optimize-overdraw --no-tessellate
      fi
    done
  fi
)