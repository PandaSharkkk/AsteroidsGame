Star[] nightSky = new Star[200];
Spaceship stan;
ArrayList <Bullet> noer;
ArrayList <Asteroid> theGarvins = new ArrayList <Asteroid>();

int score = 0;
int health = 500;
boolean gameActive = false;
boolean gameStart = true;

boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean sIsPressed = false;
boolean spaceIsPressed = false;

public void setup()
{
  size(750, 750);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i] = new Star();
  }
  stan = new Spaceship();
  noer = new ArrayList <Bullet>();

  theGarvins.add(new BigAsteroid());
  for (int k = 0; k < 7; k++) {
    theGarvins.add(new Asteroid());
  }
}
public void draw()
{
  background(0);

  if (gameActive) {
    //Score text
    fill(255);
    textSize(40);
    text("score: " + score, 300, 50);

    for (int i = 0; i < nightSky.length; i++) {
      nightSky[i].show();
    }

    //Collision between Spaceship and Asteroids
    for (int i = 0; i <theGarvins.size(); i++) {
      theGarvins.get(i).show();
      theGarvins.get(i).move();
      float d = dist(stan.getX(), stan.getY(), theGarvins.get(i).getX(), theGarvins.get(i).getY());
      if (d < 50) {
        if(i == 0 && theGarvins.get(i).getType() == "BigAsteroid"){
         gameActive = false; 
         gameStart = false;
        }
        theGarvins.remove(i);
        theGarvins.add(new Asteroid());
        health -= 25;
      }
    }

    //Bullets show
    for (int i = 0; i < noer.size(); i++) {
      noer.get(i).move();
      noer.get(i).show();

      if (noer.get(i).getX() < -50 || noer.get(i).getX() > width + 50 || noer.get(i).getY() < -50 || noer.get(i).getY() > height + 50) {
        noer.remove(i);
      }
    }

    //Collision between Asteroid and Bullets
    for (int k = 0; k < theGarvins.size(); k++) {
      for (int i = 0; i < noer.size(); i++) {
        float d = dist(noer.get(i).getX(), noer.get(i).getY(), theGarvins.get(k).getX(), theGarvins.get(k).getY());
        if (d < 50) {
          noer.remove(i);

          //Score
          if (theGarvins.get(k).getHealth() > 0) {
            theGarvins.get(k).setHealth(theGarvins.get(k).getHealth() - 1);
            if(k == 0){
             score += 5; 
            }
          } else {
            if(k == 0 && theGarvins.get(k).getType() == "BigAsteroid"){
             score += 5000;
            }
            score += 30;
            theGarvins.remove(k);
            theGarvins.add(new Asteroid());
          }
          break;
        }
      }
    }
    //SpaceShip
    stan.move();
    stan.show();

    //Health Bars
    fill(#FF2E2E);
    rect(width/2 - 250, 75, 500, 50);

    fill(#15CE47);
    rect(width/2 - 250, 75, health, 50);
    
    //Big Asteroid
    theGarvins.get(0).show();
    theGarvins.get(0).move();

    //Movement
    if (wIsPressed) {
      stan.accelerate(0.2);
      stan.fireShow();
    }
    if (aIsPressed) {
      stan.turn(-5);
    }
    if (dIsPressed) {
      stan.turn(5);
    }
    if (sIsPressed) {
      stan.accelerate(-0.2);
    }
    if (spaceIsPressed) {
      noer.add(new Bullet(stan));
    }

    if (health <= 0) {
      gameActive = false;
      gameStart = false;
    }
  } else if (gameStart) {
    for (int i = 0; i < nightSky.length; i++) {
      nightSky[i].show();
    }
    theGarvins.get(1).show();
    theGarvins.get(1).move();

    fill(255);
    textSize(60);
    text("SpaceShip Survivor", 125, 250);
    textSize(30);
    text("use wasd to move and space bar to shoot", 125, 350);
    text("press space to start!", 250, 550);
  } else {
    for (int i = 0; i < nightSky.length; i++) {
      nightSky[i].show();
    }
    theGarvins.get(1).show();
    theGarvins.get(1).move();
    fill(255);
    textSize(75);
    text("you lost lol", 200, 250);
    textSize(30);
    text("your score was: " + score, 260, 350);
    text("press r to play again!", 250, 550);
  }
}

public void keyPressed()
{
  if (key=='w')
  {
    wIsPressed = true;
  } else if (key == 'a')
  {
    aIsPressed = true;
  } else if (key == 'd')
  {
    dIsPressed = true;
  } else if (key == 's')
  {
    sIsPressed = true;
  } else if (key == ' ')
  {
    if (gameStart) {
      gameActive = true;
    }
    spaceIsPressed = true;
  }

  if (key == 'r') {
    gameActive = true;
    score = 0;
    health = 500;
    stan.reset();
    theGarvins.set(0, new BigAsteroid());
  }
  if (key == 'h') {
    stan.hyperSpace();
  }
}
public void keyReleased()
{
  if (key=='w')
  {
    wIsPressed = false;
  } else if (key == 'a')
  {
    aIsPressed = false;
  } else if (key == 'd')
  {
    dIsPressed = false;
  } else if (key == 's') 
  {
    sIsPressed = false;
  } else if (key == ' ')
  {
    spaceIsPressed = false;
  }
}
