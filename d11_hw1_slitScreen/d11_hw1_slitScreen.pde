import processing.video.*;
  Capture myCap;
  int X=0;
  void setup() {
    myCap = new Capture(this, 320, 240);
    myCap.start();  
    size(600, 240);
  }
  void draw() {
    if (myCap.available()) {
      myCap.read();
      myCap.loadPixels();
      copy(myCap, (myCap.width/2), 0, 1, myCap.height, (X++%width), 0, 1, height);
    }
  }
