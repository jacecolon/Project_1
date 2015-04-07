class Circle
{
  float clocx;
  float clocy;
  float crad;
  PVector loc;
  //PVector vel;
  //PVector acc;
  boolean independent = false;
  int opacity = 0;
  
  
  //When I overloaded the constructor, I was essentially debugging/trying 
  // an alternative method to get my program to work.
  public Circle(float x, float y, float rad)
  {
    clocx = x;
    clocy = y;
    crad = rad;
  }
  
  public Circle(float x, float y, float rad, boolean ind)
  {
    clocx = x;
    clocy = y;
    crad = rad;
    independent = ind;
    loc = new PVector(x,y);
  }
  
  public Circle(PVector location)
  {
    loc = location.get();
  }
  
  //I think there is a problem with the way this works... I'm not sure yet.
  boolean colliding (Circle circ)  //So I'm still having trouble getting this to work right
                                   //I tried a few different things to get the boundary not to
                                   //extend the 1 radius past the circle but I couldn't get it
                                   //Ultimately, I left it the way it was because it did work...
                                   //just not how I want it to.
  
  {
    Circle thisCirc = new Circle(clocx, clocy, crad,independent);
    if(dist(thisCirc.getX(), thisCirc.getY(), circ.getX(), circ.getY()) < thisCirc.getR() + circ.getR())
    return true;
    else 
    return false;
  }
  
  boolean colliding (float x, float y)
  {
    if(dist(this.getX(), this.getY(), x, y) < this.getR() )
    return true;
    else 
    return false;
    
  }
  
  //with this method I fixed a previous problem where the circle does not exist 
  //in the same place as the objects of Class Vehicle.
  void update(PVector location)
  {
   loc = location.get();
   clocx = loc.x;
   clocy = loc.y;
  }
  
  //Like the constructor, these were overloaded as a way of troubleshooting. 
  //I'd reach a point where display didn't work the way I needed it to so instead
  //of deleting the old one, I just overloaded display() in case the old one may still
  // provide usefull.
  void display()
  { 
    if (independent)
    opacity = 255;
    
    fill(255, opacity);
    ellipse(clocx, clocy, crad, crad);
  }
  
    void display(float x, float y)
  { 
    if (independent)
    opacity = 255;
    
    fill(255, opacity);
    ellipse(x, y, crad, crad);
  }
  
  //to set independent
  void setDependence(boolean ind)
  {
   independent = ind; 
  }
  
  //to set rad
  void setRad(float rad)
  {
    crad = rad;
  }
  
  //to get x
  float getX()
  {
   return clocx; 
  }
  
  // to getY
  float getY()
  {
   return clocy; 
  }
  
  //to get radius
  float getR()
  {
   return crad; 
  }
  
  PVector getLoc()
  {
    return loc;
  }
  
}
