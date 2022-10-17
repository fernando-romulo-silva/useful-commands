#### Convert all VOB (DVD) to MKV ##################################################################################################################

# https://www.internalpointers.com/post/convert-vob-files-mkv-ffmpeg


# get all files to one
$ cat VTS_01_1.VOB VTS_01_2.VOB VTS_01_3.VOB VTS_01_4.VOB VTS_01_5.VOB > DVD01.VOB

$ for f in *.VOB; do \
   ffmpeg \
     -analyzeduration 100M -probesize 100M \
     -i "$f" \
     -vf scale=704:384 -aspect 16:9 \
     -map 0:1 -map 0:2 -map 0:3 -map 0:4 \
     -metadata:s:a:0 language=esp -metadata:s:a:0 title="Spanish" \
     -metadata:s:a:1 language=por -metadata:s:a:1 title="Portuguese" \
     -codec:v libx264 -crf 21 \
     -codec:a libmp3lame -qscale:a 2 \
     -codec:s copy \
     -threads 4 \
     "${f%VOB}"mkv \
     -hide_banner; 
done
   
$ for f in *.VOB; do \
   ffmpeg \
     -analyzeduration 100M -probesize 100M \
     -i "$f" \
     -vf scale=704:384 -aspect 16:9 \
     -map 0:1 -map 0:2 -map 0:3 -map 0:4 \
     -metadata:s:a:0 language=esp -metadata:s:a:0 title="Spanish" \
     -metadata:s:a:1 language=por -metadata:s:a:1 title="Portuguese" \
     -codec:v libx264 \
     -codec:a libvo_aacenc \
     -codec:s copy \
     -threads 4 \
     "${f%VOB}"mkv \
     -hide_banner; 
done

$ for f in *.VOB; do \
   ffmpeg \
     -analyzeduration 100M -probesize 100M \
     -i "$f" \
     -vf scale=704:384 -aspect 16:9 \
     -map 0:1 -map 0:2 -map 0:3 \
     -metadata:s:a:0 language=esp -metadata:s:a:0 title="Spanish" \
     -codec:v libx264 \
     -codec:a libvo_aacenc \
     -codec:s copy \
     -threads 4 \
     "${f%VOB}"mkv \
     -hide_banner; 
done