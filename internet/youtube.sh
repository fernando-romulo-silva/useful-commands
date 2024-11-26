# https://github.com/yt-dlp/yt-dlp

# donwload youtube video with subtitle eng
$ yt-dlp https://www.youtube.com/watch?v=5fk2QNkFAnE -f 'bv*[height=720]+ba' --write-auto-subs --sub-lang "en.*"

# download youtube subtitle
$ youtube-dl --convert-subs srt --sub-lang=en --write-auto-sub --skip-download 

# download youtube with 
$ youtube-dl "bestvideo[height<=720][ext=mp4]+bestaudio/[height <=? 720]" -cio '%(autonumber)s - %(title)s.%(ext)s' --restrict-filenames https://www.youtube.com/watch?v=YOUR VIDEO HERE --sub-lang en --convert-subs srt --write-sub

# download a youtube playlist
$ youtube-dl -f "bestvideo[height<=480][ext=mp4]+bestaudio/[height <=? 720]" --playlist-reverse -cio '%(autonumber)s - %(title)s.%(ext)s' --restrict-filenames https://www.youtube.com/playlist?list=YOUR LIST HERE --sub-lang en --convert-subs srt --write-sub


