#!/bin/bash
(
  cd app/

  OS_VAR="$1"
  FLAVOR_VAR="$2"

  #flutter clean
  #flutter build apk --split-per-abi --flavor production

  if [ "appbundle" = $FLAVOR_VAR ]; then
    if [ "aos" = $OS_VAR ]; then
      echo "Android AppBundle Production Building.."
      flutter build appbundle --no-tree-shake-icons --flavor production
    else
      echo "iOS AppBundle Production Not Support.."
    fi
  elif [ "production" = $FLAVOR_VAR ]; then
    if [ "aos" = $OS_VAR ]; then
      echo "Android Production Building.."
      flutter build apk --no-tree-shake-icons --flavor production
    else
      echo "iOS Production Building.."
      flutter build ipa --no-tree-shake-icons --flavor production
    fi
  elif [ "staging" = $FLAVOR_VAR ]; then
    if [ "aos" = $OS_VAR ]; then
      echo "Android Staging Building.."
      flutter build apk --no-tree-shake-icons --flavor staging
    else
      echo "iOS Staging Building.."
      flutter build ipa --no-tree-shake-icons --flavor staging
    fi
  elif [ "development" = $FLAVOR_VAR ]; then
    if [ "aos" = $OS_VAR ]; then
      echo "Android Development Building.."
      flutter build apk --no-tree-shake-icons --flavor development
    else
      echo "iOS Development Building.."
      flutter build ipa --no-tree-shake-icons --flavor development --export-options-plist=../app/ios/ExportOptions_development.plist
    fi
  elif [ "qa" = $FLAVOR_VAR ]; then
    if [ "aos" = $OS_VAR ]; then
      echo "Android Test Building.."
      flutter build apk --no-tree-shake-icons --flavor qa
    else
      echo "iOS Test Building.."
      flutter build ipa --no-tree-shake-icons --flavor qa
    fi
  fi

  echo "Build Done"
)