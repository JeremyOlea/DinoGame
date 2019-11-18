class Cactus {
  int x;
  int xStart;
  int speed = 10;
  int sizeY;
  int sizeX;
  boolean running = false;
  
  Cactus(int xPos) {
     xStart = xPos;
     x = xStart;
  }
  
  void reset() {
    x = xStart;
    running = false;
  }
  
  void drawCactus() {
    if(!running) {
      cactusType();
    }
    if(running) {
      rect(x,600-sizeY,sizeX,sizeY);
      x -= speed;
      if(x < 0 - sizeX) {
       x = 1000; 
       running = false;
      }
    }
  }
  
  void cactusType() {
    if(random(10) > 5) {
      sizeX = 40;
      sizeY = 20;
    } else {
      sizeX = 20;
      sizeY = 40;
    }
  }
  
  void spawn() {
     if(!running) {
        running = true; 
     }
  }
  
  boolean detectCollision(Character c) {
    int upperHitboxCactus = 600-sizeY;
    //int lowerHitboxCactus = 600;
    //int upperHitboxCharacter = c.y - c.size;
    int lowerHitboxCharacter = c.y;
    
    int positionCactus = x - sizeX;
    int positionCharacter = c.x - c.sizeX;
    
    if(upperHitboxCactus <= lowerHitboxCharacter && positionCactus == positionCharacter) {
       return true;
    }
    return false;
  }
  
};