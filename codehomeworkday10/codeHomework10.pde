PImage bg, fg; //load BG and FG images
PImage bombs;

ArrayList bombList; 

void setup() {
  size(1000,800); // the dimensions of our game
  
  bg = loadImage("background.png"); // using jpg for a pretty background
  fg = loadImage("foreground.png"); // using gif for foreground, since it needs transparency pixels
  bombs = loadImage("bomb.png"); //bomb image
  
  bombList = new ArrayList();

  frameRate(24);
}


int heightAt(int posX){
  if (posX < 0){
    posX = 0;
  }
  if (posX > fg.width-1) {
    posX = fg.width-1;
  }
  for (int h=0;h<fg.height;h++){
    if(alpha(fg.pixels[posX+h*fg.width])>0 ) {
      return h-1; 
    }
  }
  return fg.height;
}

void bombManager(){ //iterates through the bomb array and removes bombs that have already exploded
    
    for (int i = bombList.size()-1; i >=0; i--){
      Bomb bomb = (Bomb) bombList.get(i);
      bomb.update();
      if(bomb.finished()){
        bombList.remove(i);
      }
    }
  }


void mousePressed(){
  bombList.add(new Bomb()); //adds a new bomb to the arraylist on click
}


void draw() {
  landGravity();
  image(bg,0,0);
  
  bombManager();
  image(fg,0,0);
  
}
