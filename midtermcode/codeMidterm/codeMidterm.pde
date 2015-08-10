import processing.video.*;


//Set variables
Capture video;
PImage prevFrame;

//RGB values

    color current ;
 
    float r1; 
    float g1 ;
    float b1 ;
    
    float x = 100;

float y = 100;
float sz = 100;
color bgcolor;

float current_weight = 2;
float target_weight = 2;

float current_alpha = 0;
float target_alpha = 0;

PFont font;

boolean state1 = true;



void setup() {
  size(1280, 640);
  frameRate(30);
  font = loadFont("ArialMT-32.vlw");




  //allows you to properly set your camera and the resolution/FPS by getting/printing available cameras
  String[] devices = Capture.list();
  println(devices);

  //input camera settings
  video = new Capture(this, 640, 480, "USB2.0 Camera", 30);

  prevFrame = createImage(video.width, video.height, RGB);
  video.start();

  noCursor();
}

void rgbDraw() {
  background(0);
  // initiates video capture
  if (video.available()) {
    // stores previous frame of video for image comparison
    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
    prevFrame.updatePixels();
    video.read();
  }

  //this displays the camera feed in the specified window area
  image(video, 265, 0, width-255, height);

//loads the pixel data from the previous video frame into an array
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  // Sum the brightness of each pixel
  for (int i = 0; i < video.pixels.length; i++) {
   current = video.pixels[i];
    // defines the current color variable(?)
    
    //creates variables for the RGB values
     r1 = red(current); 
     g1 = green(current);
     b1 = blue(current);
   
  }


  //Draw the visual elements on the screen window
  drawInterface();


}

void drawInterface() {
 
  
  //red bar
  
// r1 = red(current) - 10;
 b1 = blue(current) + 10;
  
  fill(255,0,0,230);
  noStroke();
  rect(10, 110, r1, 15);
  
  textFont(font, 12);  
  fill(255, 0, 0, 230);
  text("Red Value:"+ r1, 5, 110-8);
   
  
  
  //green bar
  fill(0,255,0,230);
  noStroke();
  rect(10, 150, g1, 15);
  
  textFont(font, 12);  
  fill(0, 255, 0, 230);
  text("Green Value:"+ g1, 5, 150-8);
  
   //blue bar
  fill(0,0,255,230);
  noStroke();
  rect(10, 190, b1, 15);
  
  textFont(font, 12);  
  fill(0, 0, 255, 230);
  text("Blue Value:"+ b1, 5, 190-8);
  
  //values for drawing the shapes
  
  if (r1 > g1 && r1 > b1) {
    
    fill(r1,0,0);
    ellipse(random(1, width),random(1,height), random(250,500),random(250,500));
    
  } else if (g1 > r1 && g1 > b1) {
    
    fill(0,g1,0);
    ellipse(random(1, width),random(1,height), random(250,500),random(250,500));
  } else if (b1 > r1 && b1 > r1) {
    
    fill(0,0,b1);
    ellipse(random(1, width),random(1,height), random(250,500),random(250,500));
  }

//displays the current color on the bottom
fill (r1, g1, b1);
noStroke();
rect(0, 500, 265,200);


// creepy one
// from the air drawing tutorial on funprogramming.org
}
void brightnessDraw(){
  
  background(0);
  
 
  

{
  if(video.available()) {
    video.read();
  }
    video.loadPixels();
    loadPixels();
    for(int i=0; i<video.pixels.length; i++) {
      if(brightness(video.pixels[i]) > 200) {
        pixels[i] = color(255);
      }
    }
    updatePixels();
  }

}



void draw() {
  
 if (state1 == true) {
 rgbDraw();
 } else {

 brightnessDraw(); 
 }
}

void keyPressed() {

if (keyPressed) {
    if (key == ' '){
      state1 = !state1;
    }
}
 
 if (keyPressed) {
   if (key == 'c') {
     video.stop();
   } else if
     (key == 'v'){
       video.start();
     }
  
}
}

