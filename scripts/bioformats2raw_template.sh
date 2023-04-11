#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
JAR_DIR="$(dirname "$SCRIPT_DIR")"
JAR_FILE=$(find "$JAR_DIR/libs" -iname 'bioformats2raw*.jar' | head -n 1)
java -jar "$JAR_FILE" "$@"
