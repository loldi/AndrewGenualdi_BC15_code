import ddf.minim.*;
Minim minim;
AudioPlayer soundShoot;

Player ship;
ArrayList<Bullet> shots;

Boolean keyLeft = false;
Boolean keyRight = false;
Boolean keyShoot = false;
Boolean keyUp = false;
Boolean keyDown = false;

ArrayList<Alien> aliens;

void setup() {
  size(800, 600);
  frameRate(30); 
  background(0); 
  ship = new Player(width/2, height*0.85);
  shots = new ArrayList<Bullet>();
  
  minim = new Minim(this);
  soundShoot = minim.loadFile("laser.wav");
  
  restart();
}

void draw() {
  //making the trailing effect background
  background(255);
  
  ship.display();
  ship.update();
  
  
  
  for (int i=0; i<shots.size(); i++) {
    Bullet b = shots.get(i);
    b.update();
    b.display();
    b.dissipate(i); 
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) { keyRight = true; }
    if (keyCode == LEFT) { keyLeft = true; }
    if (keyCode == UP) {keyUp = true;}
    if (keyCode == DOWN) {keyDown = true;}
  }
  if (key == ' ') { keyShoot = true; }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) { keyRight = false; }
    if (keyCode == LEFT) { keyLeft = false; }
     if (keyCode == UP) {keyUp = false;}
    if (keyCode == DOWN) {keyDown = false;}
  }
  if (key == ' ') { keyShoot = false; }
}

void restart() {
  ship.x = width/2;
  ship.y = height*0.9;
  ship.alive = true; 
}
