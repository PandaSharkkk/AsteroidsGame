class BigAsteroid extends Asteroid {
  public BigAsteroid() {
    super();
    turnSpeed = (Math.random()*4) - 2;
    xCorners = new float[] {-15 * 1.5, -13 * 1.5, -8 * 1.5, -6 * 1.5, 0, 7 * 1.5, 7.5 * 1.5, 12 * 1.5, 11 * 1.5, 6 * 1.5, 7 * 1.5, 2 * 1.5, -3 * 1.5, -5 * 1.5, -10 * 1.5};
    yCorners = new float[] {0, 5 * 1.5, 10 * 1.5, 13.75 * 1.5, 15 * 1.5, 13.25 * 1.5, 7 * 1.5, 2 * 1.5, -4 * 1.5, -8 * 1.5, -11.5 * 1.5, -12 * 1.5, -11 * 1.5, -8 * 1.5, -5 * 1.5};
    myColor = color(#8E4646);
    myXspeed = (Math.random()*4) - 2;
    myYspeed = (Math.random()*4) - 2;
    health = 500;
  }

  public String getType() {
    return "BigAsteroid";
  }
}
