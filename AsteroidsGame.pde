Star[] nightSky = new Star[200];
Spaceship stan;

boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;
boolean sIsPressed = false;

public void setup()
{
  size(500, 500);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i] = new Star();
  }
  stan = new Spaceship();
}
public void draw()
{
  background(0);
  for (int i = 0; i < nightSky.length; i++) {
    nightSky[i].show();
  }
  stan.move();
  stan.show();

  if (wIsPressed) {
    stan.accelerate(0.25);
    stan.fireShow();
  }
  if (aIsPressed) {
    stan.turn(-5);
  }
  if (dIsPressed) {
    stan.turn(5);
  }
  if (sIsPressed) {
    stan.accelerate(-0.4);
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
  }
}
