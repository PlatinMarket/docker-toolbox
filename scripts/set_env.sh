#!/bin/bash
key="$1"
value="$2"

if [ -z "$key" ] || [ -z "$value" ]; then
  echo "Usage: set_env [Key] [Value]"
  exit 1
fi

eval $(echo "export $key=$value")

if [ $? -eq 0 ]; then
    echo "Done"
    exit 0
else
    echo "Fail"
    exit 1
fi
