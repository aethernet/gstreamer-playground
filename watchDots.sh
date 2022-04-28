#!/bin/bash

inotifywait -m /files/dots/ -e create -e moved_to |
  while read dir action file; do
    echo "The file '$file' appeared in directory '$dir' via '$action'"
    if [[ -z "$DOT_PROCESSING_PNG"]]; then
      dot -Tpdf /files/dots/$file > /files/$file.pdf;
    else 
      dot -Tpng /files/dots/$file > /files/$file.png;
    fi
  done