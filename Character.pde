class Character {
  int x = 30;
  int y = 600;
  int jumpSpeed = 7;
  boolean jumping = false;
  int sizeX = 30;
  int sizeY = 60;
  
  Character() { 
  }
  
  void drawCharacter() {
   rect(x, y-sizeY, sizeX, sizeY); 
   fill(0);
  }
  
  void reset() {
    x = 30;
    y = 600;
    jumpSpeed = 7;
    jumping = false;
  }
  
  int jump() {
    if(y > 500 && !jumping) {
       y -= jumpSpeed; 
       return 0;
    } else {
      y += jumpSpeed;
      jumping = true;
      return y;
    }
  }
  
};