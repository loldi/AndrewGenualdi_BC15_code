void setup(){
 size(500,500);
colorMode(HSB);
noStroke();
  
}

void draw(){
  background(0);
  fill(0);
  
  float posX, posY;
  
  posX = mouseX;
  posY = mouseY;
  
  float x, y;
  

  
  
  for (int j = height; j >=0; j--) {
    for (int i = width; i > 0; i--) {
        fill(i * 5, 255,255);
        ellipse(i*20, j*20, i+posX, i+posY);  
    }
  }
    
  
  if (posX > 100){
   posX = 0; }
}