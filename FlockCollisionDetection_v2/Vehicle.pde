class Vehicle
{
  Circle personalBubble;  // why are you creating a new circle here?
  
  float maxSpeed;
  float maxForce;
  float r;
  float crad = 6;
  PVector location;
  PVector velocity;
  PVector acceleration;
  //boolean colliding = false;
  
  
  Vehicle(float x, float y)
  {
    location = new PVector(x, y);
    r = 6;
    maxSpeed = 1.1;
    maxForce = 0.3;
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    personalBubble = new Circle(location.x,location.y,crad +2);
  }
  
  void isColliding(Circle other)
  {
   if (personalBubble.colliding(other))  // you are checking the new circle you created
                                         // against the circle in question in your main tab
    velocity.mult(0); 
    
    /*
      Whereas instead, what you want to do is to see if the vehicle is close to the
      circle. Not the new circle against the existing circle.
      So you are going to want to:
      
      - get the vehicle's position
      - calculate the distance between it and the circle
      - if that distance is greater than the combined radii (might have to tweak here)
      - then do something
    
    */
  }
  
  void update()
  {
    
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
    personalBubble.update(location);
  }
  
  void display()
  {
     //noStroke();
     // personalBubble.display();
     stroke(255);
     fill(255, 200, 0);
     pushMatrix();
     translate(location.x, location.y);
     triangle(0,0,3,6,6,0);
     popMatrix();
  }
  
  PVector separate(ArrayList<Vehicle> vehicles)
 {
   float howFarApart = r *1.5;
   PVector sum = new PVector();
   int count = 0;
   for(Vehicle other: vehicles)
   {
     float d = PVector.dist(location,other.location);
     
     if(d>0 && d<howFarApart)
     {
       PVector diff = PVector.sub(location,other.location);
       diff.normalize();
       diff.div(d);
       sum.add(diff);
       count++;
     }
   }
   if(count > 0)
   {
     sum.div(count);
     sum.normalize();
     sum.mult(maxSpeed);
     sum.sub(velocity);
     sum.limit(maxForce);
   }
   return sum;
  }
  
  PVector seek(PVector target) 
  {
   PVector desired = PVector.sub(target,location);
   desired.setMag(maxSpeed);
   PVector steer = PVector.sub(desired,velocity);
   steer.limit(maxForce); 
   return steer;
  }
  
  
  void avoid(Circle circ) 
  {
   PVector c = circ.getLoc();

   
   PVector desired = PVector.sub(location,c);
   desired.setMag(maxSpeed);
   PVector steer = PVector.sub(desired,velocity);
   steer.limit(.35); 
   applyForce(steer);
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  //Ok so essentially this takes the different behaviors like seek, avoid, and seperate
  //and implements them all here.
  //I definitely did everything in this assignment the longest, hardest to understand
  //way possible so... sorry about that.
  void applyBehaviors(ArrayList<Vehicle> vehicles, Vehicle2 chase, Circle circ)
  {
   PVector getAway = separate(vehicles);
   PVector nomad = new PVector(chase.getX(),chase.getY());
   
   //this says that if the vehicle is within 1 radius of a circle to avoid it
   //if (personalBubble.colliding(circ)){
     
   
     if (circ.colliding(location.x,location.y)){
   avoid(circ);  
   }//Otherwise, keep seeking the nomad (or vehicle2 if that's easier to understand)
   else{
   PVector seekForce = seek(nomad);
   applyForce(seekForce);
   }
   //And to always keep your distance from all other vehicles
   getAway.mult(1.5);
   applyForce(getAway);
   
  }
  
  float getX()
  {
   return location.x; 
  }
  
  float getY()
  {
   return location.y; 
  }
  
 
}
