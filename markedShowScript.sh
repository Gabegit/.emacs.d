#!/bin/bash

cat | pandoc  --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash -r markdown+simple_tables+table_captions+yaml_metadata_block --data-dir=/Users/gabe/Documents/learn/skills/write-research-paper-with-pandoc/ -w html -s -S --filter pandoc-citeproc --mathjax --bibliography=/Users/gabe/Documents/Research/mylib.bib
/Users/gabe/.emacs.d/markedShowScript.sh
