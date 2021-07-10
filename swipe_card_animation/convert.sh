ORIGINAL_IMAGES=$(find . -type f -name "[0-9]?.png" | sed 's/png/mapped.png/')

make -j4 $ORIGINAL_IMAGES

# Show each image for 1/30 of a second and set the output framerate to 30.
# crf is the quality.
# The cropping is a trick to make the resolution divisible by 2 - requirement of libx264.
ffmpeg -r 25 -pattern_type glob -i '*.mapped.png' -c:v libx264 -crf 0 -r 25 -pix_fmt yuv420p -preset veryslow -crf 2 -tune animation -vf "crop=trunc(iw/2)*2:trunc(ih/2)*2,scale=640:-1" anim.mp4
