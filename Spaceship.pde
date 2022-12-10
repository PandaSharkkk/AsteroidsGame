class Spaceship extends Floater
{
  private int corners1, corners2, corners3, myColorFire, myO;
  private float[] xCorners1, yCorners1, xCorners2, yCorners2, xCorners3, yCorners3;
  public Spaceship() {
    corners = 8;
    xCorners = new float[] {-1.25, -1.25, -1.5, -1.5, -1.25, -1.25, 2.15, 2.15};
    yCorners = new float[] {0.85, 0.6, 0.675, -0.675, -0.6, -0.85, -0.85, 0.85};

    corners1 = 4;
    xCorners1 = new float[] {-1, -1.45, -0.56, 0.19};
    yCorners1 = new float[] {0.85, 1.3, 1.6, 0.85};

    corners2 = 4;
    xCorners2 = new float[] {-1, -1.45, -0.56, 0.19};
    yCorners2 = new float[] {-0.85, -1.3, -1.6, -0.85};

    corners3 = 3;
    xCorners3 = new float[] {2.15, 3.65, 2.15};
    yCorners3 = new float[] {0.85, 0, -0.85};

    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
    myColor = 175;
    myColorFire = color(#FA4E1E);
    myO = (int)(Math.random()*155) + 100;
  }

  public void reset() {
    myCenterX = width/2;
    myCenterY = height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void hyperSpace() {
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = (Math.random()*360);
    myCenterX = (Math.random()*width);
    myCenterY = (Math.random()*height);
  }

  public void fireShow() {
    noStroke();
    myO = (int)(Math.random()*155) + 100;
    fill(myColorFire, myO);

    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);

    beginShape();
    vertex(-3 * 15 + (float)myXspeed, 0 * 15 + (float)myYspeed);
    vertex(-1.65 * 15 + (float)myXspeed, 0.3 * 15 + (float)myYspeed);
    vertex(-1.65 * 15 + (float)myXspeed, -0.3 * 15 + (float)myYspeed);
    endShape(CLOSE);

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }

  public float getX() {
    return (float)myCenterX;
  }

  public float getY() {
    return (float)myCenterY;
  }

  public float getXspeed() {
    return (float)myXspeed;
  }

  public float getYspeed() {
    return (float)myYspeed;
  }

  public double getPoint() {
    return (double)myPointDirection;
  }

  public void show() {
    fill(175);
    noStroke();

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //main body
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI] * 15 + (float)myXspeed, yCorners[nI] * 15 + (float)myYspeed);
    }
    endShape(CLOSE);

    //side
    beginShape();
    for (int nI = 0; nI < corners1; nI++)
    {
      fill(255, 0, 0);
      vertex(xCorners1[nI] * 15 + (float)myXspeed, yCorners1[nI] * 15 + (float)myYspeed);
    }
    endShape(CLOSE);

    //side
    beginShape();
    for (int nI = 0; nI < corners2; nI++)
    {
      fill(255, 0, 0);
      vertex(xCorners2[nI] * 15 + (float)myXspeed, yCorners2[nI] * 15 + (float)myYspeed);
    }
    endShape(CLOSE);


    //top
    beginShape();
    for (int nI = 0; nI < corners3; nI++)
    {
      fill(255, 0, 0);
      vertex(xCorners3[nI] * 15 + (float)myXspeed, yCorners3[nI] * 15 + (float)myYspeed);
    }
    endShape(CLOSE);


    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
