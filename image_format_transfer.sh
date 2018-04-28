#!/bin/bash

#transfer image format from jpg to png and change image size from 481*321 to 480*320
cd ./images/481x321/
for filename in *.jpg
do
      ffmpeg -f image2 -i $filename -f image2 -s 480*320 ../../images_png/480x320/${filename%.*}.png
done
 				
