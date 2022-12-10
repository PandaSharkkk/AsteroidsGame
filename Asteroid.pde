class Asteroid extends Floater {
  protected double turnSpeed, health;

  public Asteroid() {
    myCenterX = (Math.random()*width);
    myCenterY = (Math.random()*height);
    turnSpeed = (Math.random()*8) - 4;

    corners = 15;  //the number of corners, a triangular floater has 3
    xCorners = new float[] {-15, -13, -8, -6, 0, 7, 7.5, 12, 11, 6, 7, 2, -3, -5, -10};
    yCorners = new float[] {0, 5, 10,  13.75, 15, 13.25, 7, 2, -4, -8, -11.5, -12, -11, -8, -5};
    myColor = color(155, 150, 150);
    myXspeed = (Math.random()*9) - 4;
    myYspeed = (Math.random()*9) - 4; //holds the speed of travel in the x and y directions
    myPointDirection = (Math.random()*360); //holds current direction the ship is pointing in degrees
    health = 10;
  }
  
  public String getType(){
   return "Asteroid"; 
  }
  
  public int getHealth(){
   return (int)health; 
  }
  
  public void setHealth(int newHealth){
   health = newHealth;
  }

  public float getX() {
    return (float)myCenterX;
  }

  public float getY() {
    return (float)myCenterY;
  }

  public void move() {
    myPointDirection += turnSpeed;
    super.move();
  }
}
