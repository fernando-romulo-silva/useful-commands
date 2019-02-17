#!/bin/bash

#### Convert all mov files to mp4  ##########################################################################

# with audio
for file in *.mov; do ffmpeg -i "$file" -f mp4 -vcodec libx264 -crf 21 -preset medium -acodec mp3  "${file%mov}"mp4 -hide_banner; done

# without audio
for file in *.mov; do ffmpeg -i "$file" -f mp4 -vcodec libx264 -crf 21 -preset medium -an "${file%mov}"mp4 -hide_banner; done