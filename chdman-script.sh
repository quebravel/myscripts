#!/bin/bash

# credit from site and user Clyde for scrit
# https://retropie.org.uk/forum/topic/25770/linux-script-to-batch-convert-psx-bin-cue-to-chd/4


for i in *.cue; do chdman createcd -i "$i" -o "${i%.*}.chd"; done
