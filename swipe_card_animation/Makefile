%.gray.png: %.png
	convert $< -background white -alpha remove -alpha off -colorspace gray $@

%.mapped.png: %.gray.png generate_lut
	convert $< lut.png -clut $@

# This can be way crazier. You can specify colors on the x axis and such so explore more.
# https://legacy.imagemagick.org/Usage/canvas/
# This target creates a black and white gradient and recolors it by using a -clut.

# You could set those two points to "#d30054" "#171d26" but it doesn't look great...
GRADIENT_POINT_1 := black
GRADIENT_POINT_2 := white
generate_lut:
	convert -size 20x256 gradient: -rotate 90 -interpolate catrom \( +size xc:$(GRADIENT_POINT_1) xc:$(GRADIENT_POINT_2) +append \) -clut lut.png

.PHONY: clean
clean:
	rm *.gray.png
