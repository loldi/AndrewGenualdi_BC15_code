import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//imports all the minim library stuff




float r,g,b,a;
//creates variables r,g,b,a
float radius;
//creates a variable radius
int posX = 50;
//creates an integer variable posX with value of 50




Minim minim;
AudioPlayer song;
//loads minim and defines the song variable(?????)



void setup () {
  size(800,800);
  background(255);
  frameRate(60);
  
  minim = new Minim(this);
  //loads a new minim file?

  
  
}

void draw() {
  
  r = random(255);
  g = random(255);
  g = random(255);
  a = random(255);
  
  if (mousePressed) {
    radius = random(50);
    fill (r,g,b,a);
    ellipse(mouseX, mouseY-125, random(255), random(255));
    //if the mouse is pressed, generate a bunch of randomly colored/transparancy ellipses
  }
  else {
    fill(r,g,b,a);
    rect(posX,400, random(255), random(255));
    posX += 1;
    
  }
  
  String s = "PRESS ANY KEY FOR HOT FIRE";
  fill(50);
  text(s, 400,400,400,400);
  
  
  if (keyPressed == true) {
  song = minim.loadFile("lilseb.mp3");
  song.play();
  }

  }
  
//SORRY I DONT KNOW HOW TO GET IT TO STOP
  

