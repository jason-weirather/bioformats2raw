#!/bin/bash

set -ex

# Build the project
./gradlew clean shadowJar createBioformats2rawScript

# Install the bioformats2raw script to the conda environment
mkdir -p "${PREFIX}/bin"
cp "./build/scripts/bioformats2raw" "${PREFIX}/bin/"

