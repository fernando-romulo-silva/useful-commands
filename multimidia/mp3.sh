#!/bin/bash
#### Convert mp3s to Mp4 #########################################################################################################

for f in *.mp3; do ffmpeg -f lavfi -i color=s=160x120:r=2 -i "$f" -c:v libx264 -preset ultrafast -c:a copy -shortest "${f%.mp3}".mp4 -hide_banner; done

#### Extract mp3 audio from Video ################################################################################################

for file in *.mp4; do ffmpeg -i "$file" -vn -acodec mp3  "${file%mp4}"mp3 -hide_banner; done

for file in *.mkv; do ffmpeg -i "$file" -vn -acodec mp3  "${file%mkv}"mp3 -hide_banner; done

#### replace mp3 audio to file ###################################################################################################

for file in *.mp3; do ffmpeg -i "${file%mp3}"mp4 -i "$file" -map 0:v -map 1:a -c:v copy -shortest output-"${file%mp3}"mp4 -hide_banner; done

#### Cut the mp3 files ###########################################################################################################
# https://unix.stackexchange.com/questions/182602/trim-audio-file-using-start-and-stop-times

ffmpeg -i file.mp3 -ss 20 -to 40 -c copy file-2.mp3;

ffmpeg -i file.mp3 -ss 00:00:20 -to 00:00:40 -c copy file-2.mp3;

ffmpeg -i 180704_2257.mp3 -ss 00:04:32 -to 01:28:00 -c copy file-1.mp3;

#### Concatenate mp3 and offset parts between ###################################################################################

# put the file names on the mylist.txt
for f in ./*.mp3; do echo "file '$f'" >> mylist.txt; done

# create a silence file
ffmpeg -filter_complex aevalsrc=0 -t 3 Silence.mp3

# edit mylist.txt and put silence between the names
edit file and put 'Silecen.mp3' between the files

# concat audio files
ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp3