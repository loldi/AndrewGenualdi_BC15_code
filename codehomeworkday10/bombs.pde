class Bomb {

  PVector pos, v; 
  Boolean isAlive;


  Bomb () {
    isAlive = true;
    pos = new PVector(mouseX, mouseY);
    v = new PVector(2, 9);
  }

  void update() {
    int h = 0, bombX = int(pos.x);

    if (bombX<0 || bombX>=fg.width) //is the bomb within the boundaries of the screen
    {
      isAlive = false; //get rid of it
      return;
    }

    h = heightAt(bombX);

    v.y += 0.6; //adds gravity to the bombs

    pos.add(v);


    if (pos.x < 0 || pos.x >=fg.width || pos.y < 0) { //is it off the sides or top of the screen?
      isAlive = false;
    } else if (pos.y >=fg.height-1 || (pos.y > h)) { //or if its off the bottom or under it
      pos.y = h; //moves the bomb to ground level automatically

      isAlive = false;  //mark for deletion
      shredLand(pos.x, pos.y, 90, 6000); //execute shred command
    } else {
      pushMatrix();
      translate(pos.x, pos.y);
     
      image(bombs, 0, 0);
      popMatrix();
    }
  }

  Boolean finished() {
    return(isAlive == false);
  }
  
  
}

