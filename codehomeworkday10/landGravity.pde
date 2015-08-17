void landGravity() {


  fg.loadPixels(); //loads the pixels of the foreground image

  for (int j = 0; j<fg.width; j++) {
    for (int k = fg.height; k>0; k--) {
      int i = j+k*fg.width;
      if (i<0 || i>=fg.pixels.length-2*fg.width-1) {
        continue;
      }

      color c = fg.pixels[i];
      color comp = fg.pixels[i+fg.width];
      color comp2 = fg.pixels[i+2*fg.width];
      color cuse = -1;
      int dx = 0;
      int dy = 0;
      float ac = alpha(c);

      if (ac > alpha(comp2)) {
        cuse = comp2;
        dy = 2;
      } else if (ac>alpha(comp)) {
        cuse = comp;
        dy = 1;
      } else if (random(4) < 1 && 1+1+2*fg.width < fg.pixels.length) {
        comp = fg.pixels[i+1+fg.width];
        comp2 = fg.pixels[i+1+fg.width];

        if (ac>alpha(comp) && ac>alpha(comp2)) {
          float r = red(fg.pixels[i]);
          float g = green(fg.pixels[i]);
          float b = blue(fg.pixels[i]);
          fg.pixels[i] = color (r, g, b, 0);
        }
        continue;
      } else {
        continue;
      }

      if (random(3)>1) { //random left/right movement after pixels are erased
        if (random(2) < 1 && i%fg.width>=0) {
          if (ac>alpha(fg.pixels[i+dx-1+dy*fg.width])) {
            dx--;
          }
        }
        if (random(2)<1 && i% fg.width<fg.width) {
          if (ac>alpha(fg.pixels[i+dx+1+dy*fg.width])) {
            dx++;
          }
        }
      }

      float r = red(fg.pixels[i]);
      float g = green(fg.pixels[i]);
      float b = blue(fg.pixels[i]);
      fg.pixels[i] = color (r, g, b, 0);
      fg.pixels[i+dx+dy*fg.width] = c;
    }
  }
  fg.updatePixels();
}

