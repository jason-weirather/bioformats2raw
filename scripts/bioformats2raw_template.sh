#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
JAR_DIR="$(dirname "$SCRIPT_DIR")"
java -jar "$JAR_DIR/libs/bioformats2raw-0.6.1.jar" "$@"
