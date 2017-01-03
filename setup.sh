#!/bin/bash

echo 'Downloading dataset...'

#download dataset first,
http://opus.lingfil.uu.se/download.php?f=OpenSubtitles2016%2Fko.tar.gz
#wget http://opus.lingfil.uu.se/download.php?f=OpenSubtitles/en.tar.gz

echo 'Unzipping dataset...'

#Making assumption that user hasn't put any other tar files in folder
#Two tar ball extractions because during testing it downloaded as .gz once?
tar -xzvf *.tar.gz

echo 'Extracting dataset...'

#extract all filesin sub-directories
find . -name '*.gz' -exec gunzip '{}' \;

echo 'Running python preprocessor...'

#run python pre-processor
python opensubtitleparser.py

