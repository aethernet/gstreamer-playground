#!/bin/bash

if [[ -z "${STOP_PIPELINE_AFTER_SEC}" ]]; then
  echo "NOT STOPPING PIPE"
else 
  echo "WILL STOP PIPELINE IN $STOP_PIPELINE_AFTER_SEC SECONDS"
  sleep $STOP_PIPELINE_AFTER_SEC
  echo "STOP PIPELINE"
  killall -s SIGINT gst-launch-1.0
fi