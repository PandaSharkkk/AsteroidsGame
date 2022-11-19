

class Star //note that this class does NOT extend Floater
{
  //your code here
  private int myX, myY, myC, mySize, myO;
  
  public Star (){
   myX = (int)(Math.random()*width);
   myY = (int)(Math.random()*height);
   mySize = (int)(Math.random()*5) + 3;
   myC = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
   myO = 255;
  }
  
  public void show(){
    myO = (int)(Math.random()*155) + 100;
    fill(myC, myO);
    ellipse(myX, myY, mySize, mySize);
  }
}
