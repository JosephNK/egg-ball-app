#!/bin/bash
(
  cd app/

  dart pub outdated --mode=null-safety
)