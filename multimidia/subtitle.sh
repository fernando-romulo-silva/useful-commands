#### Merge subtitle with video file #####################################################################################################################

# Mp4 simple 
$ ffmpeg -i infile.mp4 -i infile.srt -c copy -c:s mov_text outfile.mp4

# Mux mp4
$ ffmpeg -i input.mp4 -f srt -i input.srt -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s mov_text output.mp4

# Mux mkv
$ ffmpeg -i input.mp4 -f srt -i input.srt -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt  output.mkv
