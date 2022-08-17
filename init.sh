#!/usr/bin/env bash

set -e

ENVIRONMENT_NAME=${SPRING_PROFILES_ACTIVE}
echo "ENVIRONMENT_NAME: ${ENVIRONMENT_NAME}"

COMMAND=${1:-"web"}
echo "$COMMAND"

case "$COMMAND" in
  baseCheck)
    exit 0
    ;;
  web)
      exec java -Dspring.profiles.active=${ENVIRONMENT_NAME} \
      -jar /app/backend-model*.jar \
      $COMMAND
    ;;
  *)
    exec sh -c "$*"
    ;;
esac