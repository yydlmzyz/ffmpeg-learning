#!/bin/bash

width=480
height=320
QP=42
input_dir='480x320'
output_dir='480x320'

cd ./images_png/$input_dir/
for filename in *.png
do 
	ffmpeg -f image2 -i $filename -pix_fmt yuv420p -s $width*$height  ../../yuv/${filename%.*}.yuv
	#transfer from RGB to YUV and store in folder another folder
        
	ffmpeg -s $width*$height -i ../../yuv/${filename%.*}.yuv -c:vcodec libx265 -x265-params "qp=$QP:bframes=0" ../../yuv/${filename%.*}.hevc
	#compress image use H.265/HEVC and store the result in the same floder
	ffmpeg -i ../../yuv/${filename%.*}.hevc -s $width*$height ../../output/$output_dir/${filename%.*}.png
	#output the images from binary file and store in output_dir
done



