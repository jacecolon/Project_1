
class Petal
{
// Allocate memory for instance variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector acceleration2;
  float maxSpeed= 1;
  float lifeSpan;
  int x;
  int y;

  //Constructor accepts a PVector as a paramater
  Petal() 
  {
    //Initializing variables
    acceleration = new PVector(0,0);
    acceleration2 = new PVector(0,0);
    velocity = new PVector(0,0);
    
    x = int(random(600));
    x += 50;
    y = int(-10);
    
    location = new PVector(x,y);
    lifeSpan = random(500) +100;
  }
  
  void update() 
  {
    velocity.add(acceleration);
    velocity.add(acceleration2);
    velocity.limit(maxSpeed);
    location.add(velocity);
    //acceleration.mult(0);
    lifeSpan -= 1;
  }
  
  void display()
  {
    
     stroke(255,170,122,lifeSpan);
     fill(255,160,122, lifeSpan);
     //ellipse(location.x, location.y, 10,10);
     //Trying to see what looks best
     rect(location.x, location.y, 10,10);
     //triangle(location.x, location.y,location.x+15,location.y+10,location.x+30,location.y);
  }
  
  //I created this applyForce to implement in ParticleSystem so 
  //I can get the triangles to follow the mouse's 
  //x-coordinates.
  
  void applyForce(PVector followTheMouse)
  {
  acceleration.add(followTheMouse);
  }
  
   void applyForce(PVector followTheMouse, PVector gravity)
  {
   //Me debugging here 
    //System.out.println(followTheMouse + "..." + gravity);
  acceleration.add(followTheMouse);
  acceleration2.add(gravity);
  }

  // To test and see if you can still see the particle
  boolean isDead() 
  {
    if(lifeSpan <= 0)
    {
      return true;
    }
      else 
    {
      return false;
    }
  }
}

