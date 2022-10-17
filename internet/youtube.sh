# https://github.com/rg3/youtube-dl

# donwload youtube video with subtitle eng
$ youtube-dl --write-sub --skip-download --sub-lang=en "https://www.youtube.com/watch?v=YOUR VIDEO HERE"

# download youtube subtitle
$ youtube-dl --convert-subs srt --sub-lang=en --write-auto-sub --skip-download https://youtu.be/UZ9VKxxGo58

# download youtube with 
$ youtube-dl "bestvideo[height<=720][ext=mp4]+bestaudio/[height <=? 720]" -cio '%(autonumber)s - %(title)s.%(ext)s' --restrict-filenames https://www.youtube.com/watch?v=YOUR VIDEO HERE --sub-lang en --convert-subs srt --write-sub

# download a youtube playlist
$ youtube-dl -f "bestvideo[height<=480][ext=mp4]+bestaudio/[height <=? 720]" --playlist-reverse -cio '%(autonumber)s - %(title)s.%(ext)s' --restrict-filenames https://www.youtube.com/playlist?list=YOUR LIST HERE --sub-lang en --convert-subs srt --write-sub
