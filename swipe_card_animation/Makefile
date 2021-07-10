%.gray.png: %.png
	convert $< -background white -alpha remove -alpha off -colorspace gray $@

%.mapped.png: %.gray.png generate_lut
	convert $< lut.png -clut $@

# This can be way crazier. You can specify colors on the x axis and such so explore more.
# https://legacy.imagemagick.org/Usage/canvas/
# This target creates a black and white gradient and recolors it by using a -clut.
generate_lut:
	convert -size 30x600 gradient: -rotate 90 -interpolate catrom \( +size xc:"#d30054" xc:"#171d26" +append \) -clut lut.png

.PHONY: clean
clean:
	rm *.gray.png
