void shredLand(float posX_f, float posY_f, int rad, int count) {
  
  int posX = int(posX_f);
  int posY = int(posY_f);
  
  fg.loadPixels();
  
  
  for (int i = 0; i <count; i++){
    float range = radians(random(360)); //pick a random direction
    float distance = 1+random(rad); //at a random distance in that direction
    int nx = int (posX+distance*cos(range)); //identify the X position the specified direction refers to
    
    if (nx > 0 && nx < fg.width-1) {
      int dest = nx+int(posY+distance*sin(range))*fg.width;
      
      if (dest >=0 && dest < fg.pixels.length){
        fg.pixels[dest] = color (255,255,255,0);
      }
    }
  }
  
  fg.updatePixels();
}

