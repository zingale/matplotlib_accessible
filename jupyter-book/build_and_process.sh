#!/bin/sh

jupyter-book build content

cd content/_build/html
for i in $(grep -l "# alt-text" *.html)
do
  echo $i
  ../../../parse_alt.py $i
done
