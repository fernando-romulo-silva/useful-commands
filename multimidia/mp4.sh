#### Concat mp4 files #########################################################################################################################

# Create File List
$ for f in *.mp4; do echo "file '$f'" >> mylist.txt; done

# Concatenate Files
$ ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4



# If they are NOT exactly same (100% same codec, same resolution, same type) MP4 files
$ ffmpeg -i myfile1.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts temp1.ts
$ ffmpeg -i myfile2.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts temp2.ts

# now join
$ ffmpeg -i "concat:temp1.ts|temp2.ts" -c copy -bsf:a aac_adtstoasc output.mp4
