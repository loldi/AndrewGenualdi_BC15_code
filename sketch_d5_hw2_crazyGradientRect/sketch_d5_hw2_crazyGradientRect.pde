float hVal;

void setup() {
size(500,500);
background(0, 100, 100);
}

void draw()
{

  noStroke();
  colorMode(HSB, 100, 100, 100);
  
//  int i = 0;
//  while (i < width) {
//    float distance = abs(mouseX - i);
//    fill(distance);
//    rect(i, 0 , 10, height);
//    
//    i += 10;
//    
//  }
//}



for (int i = 0; i<width; i +=10) {
  float x = abs(mouseX - i);
 
  
for (int y = 0; y<height; y +=100){
  float top = abs(mouseY - y);
  
  hVal = (x + 5);
  
    
   fill(hVal, 100, 100);
   tint(255,0.8);
  rect(i, 0, 10, height);
}
}
}