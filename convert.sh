ORIGINAL_IMAGES=$(find . -type f -name "*.png" | sed 's/png/mapped.png/')

make -j4 $ORIGINAL_IMAGES
