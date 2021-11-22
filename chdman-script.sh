#!/bin/bash

# credit from site and user Clyde for scritp
# https://retropie.org.uk/forum/topic/25770/linux-script-to-batch-convert-psx-bin-cue-to-chd/4

# first install mame-tools

# obs: the format chd no rum in emulator ePSXe, only works in emulator duckstation

for i in *.cue; do chdman createcd -i "$i" -o "${i%.*}.chd"; done
