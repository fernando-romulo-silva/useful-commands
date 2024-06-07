#### Cut mkv files #########################################################################################################################

$ ffmpeg -i input.mkv -t 00:02:30 -c:v libx264 -map 0:v:0 -map 0:a:0 -map 0:s -c:a libvo_aacenc output-cut.mkv

$ ffmpeg -i input.mkv -ss 00:02:31  -c:v libx264 -map 0:v:0 -map 0:a:0 -map 0:s -c:a libvo_aacenc output-cut2.mkv

#### Convert mkv to fit mkv file ###########################################################################################################

$ for f in *.mkv; do mv "$f" "${f%.mkv}-old.mkv"; ffmpeg -i "${f%.mkv}-old.mkv" -c:v libx264 -map 0:v:0 -map 0:a:0 -map 0:s -c:a libvo_aacenc "${f}"mkv -hide_banner;  done

$ for f in *.mkv; do mv "$f" "${f%.mkv}-old.mkv"; ffmpeg -i "${f%.mkv}-old.mkv" -c:v libx264 -map 0:v:0 -map 0:a:0 -map 0:s -c:a libvo_aacenc "${f}" -hide_banner; rm "${f%.mkv}-old.mkv"; done

#### Remove first audio track from mkv file

$ ffmpeg -i input.mkv -map '0:v' -map '0:2' -c:v copy -c:a copyoutput-cut.mkv