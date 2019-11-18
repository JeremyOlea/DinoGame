Character me = new Character();
ArrayList<Cactus> cactuses = new ArrayList<Cactus>();
boolean spacePressed = false;
boolean gameOver = false;
int score = 0;

void setup() {
  size(1000,1000);
  cactuses.add(new Cactus(1000));
  cactuses.add(new Cactus(1000));
  cactuses.add(new Cactus(1000));
}

void draw() {
  if(!gameOver) {
    background(233);
    textSize(25);
    text("Score: ", 700, 30);
    text(score, 810, 30);
    line(0,600,1000,600);
    if(spacePressed) {
       int status = me.jump();
       if(status == 600) {
         spacePressed = false;
         me.jumping = false;
       }
    }
    me.drawCharacter();
    if(random(100) > 85) {
       cactuses.get(0).spawn();
    }
    if(cactuses.get(0).x < 700 && random(100) > 60) {
       cactuses.get(1).spawn();
    }
    if(cactuses.get(1).x < 700 && random(100) > 80 && cactuses.get(0).running) {
       cactuses.get(2).spawn();
    }
    cactuses.get(0).drawCactus();
    cactuses.get(1).drawCactus();
    cactuses.get(2).drawCactus();
    Boolean collision1 = cactuses.get(0).detectCollision(me);
    Boolean collision2 = cactuses.get(1).detectCollision(me);
    Boolean collision3 = cactuses.get(2).detectCollision(me);
    if(collision1 || collision2 || collision3) {
       endGame();
    }
    score++;
  } else {
    text("Press Space to play again", 300, 300);
  }
  
}

void endGame() {
  gameOver = true;
}

void reset() {
  me.reset();
  for(int i = 0; i < cactuses.size(); i++) {
     cactuses.get(i).reset();
  }
  score = 0;
  gameOver = false;
}

void keyPressed() {
   if(key == ' ') {
     if(gameOver) {
        reset(); 
     } else {
        spacePressed = true;  
     }
   }
}