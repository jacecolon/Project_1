 // Trying to comment as we discussed


//Establishing class Particle
class FireflyParticle
{
// Allocate memory for instance variables
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float wanderAngle;
  float maxForce;    
  float maxSpeed; 
  float lifeSpan;

  //Constructor 
  FireflyParticle(PVector origin) 
  {
    //Initializing variables
    acceleration = new PVector(0,-.02);
    velocity = new PVector(0,0);
    
    r = 5;
    wanderAngle=0;
    maxSpeed= .8;
    maxForce = .03;
    //To get somewhere near the mouse but not on top of it.
    float mousex = mouseX + randomGaussian();
    float mousey = mouseY + randomGaussian();
    location = origin.get();
    lifeSpan = 400;
  }
  
  FireflyParticle(int life) 
  {
    //Initializing variables
    acceleration = new PVector(0,-.02);
    velocity = new PVector(0,0);
    
    r = 5;
    wanderAngle=0;
    maxSpeed= .8;
    maxForce = .03;
    //To get somewhere near the mouse but not on top of it.
    float x = random(800);
    float y = random(400) ;
    location = new PVector(x,y);
    lifeSpan = life;
  }
  
  //This is where I'll call all methods for ease of access.
  void run()
  {
   boolean tooClose;
   update();
   display();
   tooClose = closeEnough();
   if(!tooClose)
   {
   wander(); 
   }
   else if(tooClose)
   {
   flee();
   }
  }

  void display() 
  {
  //ellipseMode(CORNER);
  fill(255,220,0,lifeSpan);
  noStroke();
  ellipse(location.x,location.y,3,5);
  triangle(location.x-3,location.y-4,location.x,location.y,location.x+3,location.y-4);
  }
  
  void update()
  { 
  velocity.add(acceleration);
  velocity.limit(maxSpeed);
  location.add(velocity);
  acceleration.mult(0);
  lifeSpan-=1;
  /*This code is to let a firefly work independent to a system
  if(lifeSpan<=0)
  {
  lifeSpan=200;
  }*/
  }
  
  //Need to make this to be used later in a wander
  void seek(PVector target)
  {
    PVector desired = PVector.sub(target, location); // Pretty sure this is how we did it in class
    desired.setMag(maxSpeed);
    PVector turn = PVector.sub(desired,velocity);
    turn.limit(maxForce);
    applyForce(turn);
  }
  
  //Trying to make a flee behavior. It should just be the difference between adding
  //the vectors instead of subtracting right?
  //If there is an issue with this please give me your feedback
  void flee()
  {
    float x = mouseX;
    float y = mouseY;
    PVector target = new PVector(x,y);   
    PVector desired = PVector.sub(target, location); //in order to flee, you have to "flip-flop" the parameters
      
    desired.setMag(maxSpeed);
    PVector turn = PVector.sub(desired,velocity);
    turn.limit(maxForce);
    applyForce(turn);
  }
    
  
 //I didn't understand how wander works (I still don't really...) so I had to 
 //look up lot of reference videos and materials to attempt this. Hopefully it works
 //and hopefully I can understand better through the process. I'm not good with angles.
 void wander() 
 {
 float wanderR = 55;         
 float wanderD = 110;        
 float changeAngle = 0.3;
    

 PVector wanderTo = velocity.get();    
 wanderTo.normalize();            
 wanderTo.mult(wanderD);         
 wanderTo.add(location);  
    
 float heading = velocity.heading2D();    //A lot of terminology is what confuses me most.    
 wanderAngle += random(-changeAngle,changeAngle); 
 
 //I needed a lot of help with this next one. Is there another way to do this?
 PVector wanderToOffSet = new PVector(wanderR*cos(wanderAngle+heading),wanderR*sin(wanderAngle+heading));
 PVector target = PVector.add(wanderTo,wanderToOffSet);
 seek(target); //This is to find and move toward a specified location.
 }
 
  /*I made this apply force earlier when trying to make a flee differently (it didn't work).
  This is gonna go unused.
  
  void applyForce(PVector fleeTheMouse)
  {
  acceleration.add(fleeTheMouse);
  }*/
  
  //To be used in other methods to change direction
  void applyForce(PVector force)
  {
  acceleration.add(force);
  }
  
  //!*!*!*!*!*!*!**!*!*!*!*!This comment is so I can remember:
  
  //close enough is supposed to determine how far away any firefly is
  //from the mouse. Later it'll be used in an if statement saying that 
  //if this is true, disable seek and enable flee. I think you 
  //can implement close enough by measuring the magnitude? Not sure..
  //Good luck
  //P.S. You'll have to tackle the FlySystem tomorrow and hopefully
  //the petals, just try to take it one step at a time. 
  boolean closeEnough()
  {
    boolean tooClose =false;
    float x = mouseX;
    float y = mouseY;
    PVector mouse = new PVector(x,y);
    float distance = PVector.dist(location,mouse);
    if(distance <30)
    {
      tooClose = true;
    }
    return tooClose;
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

