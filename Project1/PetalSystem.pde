
//Establishing class ParticleSystem
class PetalSystem
{
// Allocate memory for instance variables
  ArrayList<Petal> petals;
  

//PetalSystem's constructor accepts a PVector as a 
//parameter.
  PetalSystem()
  {
    //Initiallizing PVector origin and ArrayList petals.
    //Petals should only consist of Petal objects.
    
    petals = new ArrayList<Petal>();
  }
  
  int getLength()
  {
    return petals.size();
  }

//I created applyForce to implement in main so 
//I can get the triangles to follow the mouse's 
//x-coordinates.
  void applyForce(PVector direction)
  {
   for(Petal p: petals)
   {
     p.applyForce(direction);
   }
  }

 void applyForce(PVector direction1, PVector direction2)
  {
   for(Petal p: petals)
   {
     //PVector direction = direction1.get();
     //direction.add(direction2);
     p.applyForce(direction1, direction2);
   }
  }

//Adds a  Petal object to the ArrayList.
  void addPetal() 
  {
    //Had to watch a video to teach me how to use ArrayLists
    //and learn some methods it comes with.
    
    //This tells the particle where to be when it spawns.
    //Origin was defined as having the same location that was
    //established in class Petal.
    petals.add(new Petal());
  }

  void run()
  {
    //Checks the size of Arraylist and subtracts one 
    //(because the index starts at 0), then, as long as 
    //the size of petals is greater than 0 the for loop
    //will go through and check for petals who's transparency
    //is less than or equal to 0
    for(int i = petals.size()-1; i >= 0; i--) 
    {
      
      Petal p = petals.get(i);
      p.update();
      p.display();
      
      if(p.isDead())
      {
        petals.remove(i);
      }
    }
  }
}
