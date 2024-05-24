#!/bin/bash
(
  cd app/

  keytool -list -v -keystore "android/com.shop.sazo.jks" -alias com.shop.sazo -storepass P@ssw0rd! -keypass P@ssw0rd!
)