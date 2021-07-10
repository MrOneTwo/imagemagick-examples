ORIGINAL_IMAGES=$(find . -type f -name "[0-9]?.png" | sed 's/png/mapped.png/')

make -j4 $ORIGINAL_IMAGES
