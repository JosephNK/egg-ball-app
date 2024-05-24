#!/bin/bash
(
  cd app/

  keytool -list -keystore "android/com.shop.sazo.jks" -v
)