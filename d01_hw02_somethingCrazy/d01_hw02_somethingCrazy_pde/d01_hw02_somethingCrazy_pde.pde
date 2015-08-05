import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
//creates a minim object which controls the library
AudioInput in;
//creates an audio input variable 'in'
FFT fft;
//fast fouray-transform - splits up soundwave into bands
//allows you to tell what the volume of different frequencies are

int w;
//creates a value 'w' that divides the width of the sketch by the # of bands in the spectrum so it gives even spacing
PImage fade;
//creates a Pimage 'fade'

float rWidth, rHeight;
//create values to control the size of the faded out image

int hVal;
//creates value for hue


void setup()
{
  size(640,480, P3D);
  //adds the P3D build in renderer
  minim = new Minim(this);
 //initializes the Minim object 
 in = minim.getLineIn(Minim.STEREO, 512);
 //gets the line-in audio from the microphone
 fft = new FFT(in.bufferSize(), in.sampleRate());
 //initalizes the FFT variable
 fft.logAverages(60, 7);
 //tell FFT to use logAverage
 
 
  stroke(255);
  w = width/fft.avgSize();
  strokeWeight(w + 1);
  strokeCap(SQUARE);
  
  background(0);
  fade = get(0, 0, width, height);
  //loads fade image with the contents of the sketch from the designated area
  
  rWidth = width * 0.99;
  //sets rWidth to 99% of full height
  rHeight = height * 0.99;
  //same as above except height
  hVal = 0;
  //sets hVal to 0
  
}

void draw()
{
  
  background(0);
  
  tint(255,255,255,254);
  //everything that you draw to the sketch gets the designated tint, and each subsequent drawing gets it as an addative effect
  image(fade, (width - rWidth)/2, (height - rHeight)/2, rWidth, rHeight);
  //draws fade image but scales it down based on rWeigth and rHeight parameters
  noTint();
  //turns off tint after image is drawn
  
  
  fft.forward(in.mix);
//passes the mix (left and right channel) sound to the FFT variable
//need to pull the values out of each FFT object band in order to draw them on the screen

  colorMode(HSB);
  stroke(hVal, 255, 255);
  colorMode(RGB);
  
   for(int i = 0; i < fft.avgSize(); i++)
//iterate through the entire array of bands
//starts at 0 and every time the loop runs it adds 1 to i, and keeps running so long as i is less than the bands in the spectrum
    {
      line((i * w) + (w / 2), height, (i * w) + (w / 2), height - fft.getAvg(i) * 4);
      //draw line at i location (x position in pixels) to the same X location minus the current band-size * 4
    }

  
  fade = get(0, 0, width, height);
  //captures the content of the image
  
  stroke(255);
   for(int i = 0; i < fft.avgSize(); i++)
//iterate through the entire array of bands
//starts at 0 and every time the loop runs it adds 1 to i, and keeps running so long as i is less than the bands in the spectrum
    {
      line((i * w) + (w / 2), height, (i * w) + (w / 2), height - fft.getAvg(i) * 4);
      //draw line at i location (x position in pixels) to the same X location minus the current band-size * 4
    }
  
  hVal += 2;
  //increases hVal by 2 after every frame
  if(hVal > 255)
  {
    hVal = 0;
  }
  
if (keyPressed) {
    if (key == 's'){
        saveFrame();
    }
}
  
  
}

