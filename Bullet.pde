class Bullet extends Floater {
  public Bullet(Spaceship stan){
    myCenterX = stan.getX() ;
    myCenterY = stan.getY();
    myXspeed = stan.getXspeed();
    myYspeed = stan.getYspeed();
    myPointDirection = stan.getPoint();
    myColor = color(#CB9A1D);
    accelerate(15);
  }
  
  public float getX() {
    return (float)myCenterX;
  }

  public float getY() {
    return (float)myCenterY;
  }
  
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;      
  }   
  
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);      
    //draw the polygon
    ellipse((float)myCenterX, (float)myCenterY, 15, 15);
  }   
}
