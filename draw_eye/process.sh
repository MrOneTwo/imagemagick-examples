WIDTH=1024
HEIGHT=1024

CENTER_X=$(expr ${WIDTH} / 2)
CENTER_Y=$(expr ${HEIGHT} / 2)
RADIUS=256
POINT_X=$(expr ${CENTER_X} + ${RADIUS})
POINT_Y=${CENTER_Y}

PUPIL_RADIUS=$(awk "BEGIN{print 0.3 * ${RADIUS}}")
PUPIL_POINT_X=$(awk "BEGIN{print ${CENTER_X} + ${PUPIL_RADIUS}}")

# Circle arguments are x0,y0 circle center, and x1,y1 any point on the circle.
convert -size ${WIDTH}x${HEIGHT} xc:black \
        -draw "fill #ba8d23ff  stroke #222f stroke-width 30  circle ${CENTER_X},${CENTER_Y} ${POINT_X},${CENTER_Y}
               fill #111111ff  stroke #fff0 stroke-width  0  circle ${CENTER_X},${CENTER_Y} ${PUPIL_POINT_X},${CENTER_Y}" \
        -gamma 1.0 eye.png

convert -size ${WIDTH}x${HEIGHT} xc:black \
        -draw "fill #ffffffff  circle ${CENTER_X},${CENTER_Y} ${POINT_X},${CENTER_Y}" \
        -blur 2x2 \
        -gamma 1.0 eye_mask.png

# Combine eye_mask.png and eye.png.
convert eye.png eye_mask.png -alpha off -compose CopyOpacity -composite -blur 4x4 eye_masked.png

convert -alpha off -size ${WIDTH}x${HEIGHT} \
        -define gradient:radii=${WIDTH},${HEIGHT} radial-gradient:#eeaaaaff-#aa1111ff \
        -gamma 1.0 eye_bg.png
