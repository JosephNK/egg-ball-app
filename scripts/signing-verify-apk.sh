#!/bin/bash
(
  cd app/

  apksigner verify --print-certs build/app/outputs/flutter-apk/app.apk
)