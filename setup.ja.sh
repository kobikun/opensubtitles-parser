#!/bin/bash

echo 'Downloading dataset...'
SLANG=ja
#download dataset first,
wget http://opus.lingfil.uu.se/download.php?f=OpenSubtitles2016%2F${SLANG}.tar.gz

echo 'Unzipping dataset...'

#Making assumption that user hasn't put any other tar files in folder
#Two tar ball extractions because during testing it downloaded as .gz once?
tar -xzvf *.tar.gz

echo 'Extracting dataset...'

#extract all filesin sub-directories
find . -name '*.gz' -exec gunzip '{}' \;

echo 'Running python preprocessor...'

#run python pre-processor
mkdir -p data.${SLANG}
python opensubtitleparser.py --rootXmlDir OpenSubtitles2016/ --dataDir data.${SLANG}/subtitle_${SLANG}_

