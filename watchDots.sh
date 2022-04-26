#!/bin/bash

# TODO: offer a ENV to disable dot files auto-conversion
inotifywait -m /files/dots/ -e create -e moved_to |
  while read dir action file; do
    echo "The file '$file' appeared in directory '$dir' via '$action'"
    # TODO: use a ENV var to choose the output format between pdf and png
    if [[ -z "$DOT_PROCESSING_PNG"]]; then
      dot -Tpdf /files/dots/$file > /files/$file.pdf;
    else 
      dot -Tpng /files/dots/$file > /files/$file.png;
    fi
    rm /files/dots/$file
  done