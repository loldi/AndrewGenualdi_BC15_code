int maxImages = 7;
PImage[] tentacle = new PImage[maxImages];
PImage bg;
int imageIndex = 0;
int displacement = 0;
boolean moveRight, moveLeft, standing;



void setup() {
  size(713,286);
  frameRate(24);
   bg = loadImage("lobby.png");
  moveRight = false;
  moveLeft = false;
  standing = true;
  for (int i=0; i<maxImages; i++) {
    tentacle[i] = loadImage("tentacle" + i + ".png");
    
  }  
}

void draw() {
  
  background(bg);
 
  imageMode(CENTER);
  
 
  
  
  
  translate(width/2 + displacement, 245);
  imageIndex = (imageIndex + 1) % maxImages;
  
  if (standing) {
    image(tentacle[0], 0, 0); 
  } 
  
  if (moveRight) {
    image(tentacle[imageIndex], 0, 0);  
    displacement += 20;
  }
  if (moveLeft) {
    scale(-1,1);
    image(tentacle[imageIndex], 0, 0);  
    displacement -= 20;
  }
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight = true; 
      standing = false; 
    } else if (keyCode == LEFT) {
      moveLeft = true;
      standing = false;
    }
  }  
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (moveRight) {
        moveRight = false;  
        standing = true;
      }
    } else if (keyCode == LEFT) {
      if (moveLeft) {
        moveLeft = false;
        standing = true;
      }  
    }
  }  
}


