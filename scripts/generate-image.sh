#!/bin/bash
(
  cd app/

  # Current Project Not Using
  echo "Current Project Not Using"
  exit

  SECONDS=0
  echo "IMAGE TASK Generator :)"
  NEWLINE=$'\n'
  PUB_SPEC_RESULT="assets:${NEWLINE}  # Images${NEWLINE}"
  IMAGE_DART="import 'package:flutter/material.dart';${NEWLINE}${NEWLINE}class GeneratorImage {${NEWLINE}"
  for entry in "assets/images"/*.png
  do
      PUB_SPEC_RESULT+="  - $entry${NEWLINE}"
      FILENAME=$(basename "${entry%.*}")
      IMAGE_DART+="  static const $FILENAME = AssetImage('$entry');${NEWLINE}"
  done
  IMAGE_DART+="}"
  if [ ! -d assets/_g ]; then
      mkdir assets/_g
  fi
  echo "$PUB_SPEC_RESULT" > assets/_g/image_yaml.log
  echo "$IMAGE_DART" > assets/_g/image_dart.log
  echo "IMAGE TASK Finished :)"
  echo $SECONDS
)