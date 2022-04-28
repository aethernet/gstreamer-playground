#!/bin/bash

OS_VERSION=$(echo "$BALENA_HOST_OS_VERSION" | cut -d " " -f 2)
echo "Device Type is $BALENA_DEVICE_TYPE"

# we can do stuff here if needed (like configure camera with v4l2-ctl)

mkdir -p /files/traces
mkdir -p /files/dots

if [[ -z "$PERSIST_FILES" ]]; then
  echo "NOT DELETING FILES"
else 
  echo "DELETING FILES"
  rm /files/*
  rm /files/traces/*
  rm /files/dots/*
fi

# Wait for xserver to accept connections if we're a receiver
if [[ -z "$NOWAIT_X" ]]; then
  while [ `ls /tmp/.X11-unix/ | wc -l` == 0 ]; do echo "display not created yet"; sleep 0.5; done; echo "display created";
  DISPLAY=`ls /tmp/.X11-unix/ | sed s/X/:/`
  export DISPLAY
  echo "DISPLAY is set to $DISPLAY"
  while ! xset -q; do echo "display doesn't accept connection yet"; sleep 0.5; done; echo "display ready";
fi

if [[ -z "$NO_DOT_PROCESSING" ]]; then
  echo "WATCH DOTS FOLDER AND PROCESS AUTOMATICALLY"
  /usr/src/watchDots.sh & >> /dev/tty0
fi
  
if [[ -z "${PIPELINE}" ]] ; then
  echo "No PIPELINE, let's idle"
else
  echo "PIPELINE is set, will run : $PIPELINE"
  gst-launch-1.0 -v $PIPELINE & >> /dev/tty0
  # kill pipeline after STOP_PIPELINE_AFTER_SEC seconds
  /usr/src/killpipe.sh & >> /dev/tty0
fi

if [[ -z "${NO_TRACE_PROCESSING}" ]]; then
  echo "WILL PROCESS TRACES WHEN GST-LAUNCH QUITS"
  /usr/src/watchTraces.sh & >> /dev/tty0
fi

balena-idle
