#### Convert ODT for PDF ######################################################################################################

find . -type f -name "*.odt" | while read i ; do libreoffice --headless --convert-to pdf "${i}"; done

#### Change "_" for " " files name ############################################################################################

for file in * ; do mv -v "$file" "$(echo $file | sed 's/_/ /g')" ; done

#### Convert image to PDF #####################################################################################################

convert *.png  -compress jpeg -resize 1240x1753  -extent 1240x1753 -gravity center -units PixelsPerInch -density 150x150 multipage.pdf

convert *.png  -compress jpeg -gravity center   -units PixelsPerInch -density 300x300 multipage.pdf

#### Convert txt to PDF #####################################################################################################

install xelatex and pdflatex

for file in *.txt; do libreoffice --convert-to "pdf" "$file"; done

for file in *.txt; do pandoc --latex-engine=xelatex "$file" -o "${file%txt}"pdf; done