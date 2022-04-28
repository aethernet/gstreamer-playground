#!/bin/bash

  # wait for gst-launch to end
  sleep 2;
  until [[ -z `pidof gst-launch-1.0` ]]; do
    sleep 5;
  done

  cd /gst-shark/scripts/graphics/
  
  ./gstshark-plot /files/traces -s pdf -l outside >> /dev/null

  mv *.pdf /files/

  echo "PROCESSING TRACES : OK"