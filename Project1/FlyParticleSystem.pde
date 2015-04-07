// A class to utilize class FireflyParticle and make a 
// "system" of Particle objects using ArrayList.


//Establishing class FlyParticleSystem
class FlyParticleSystem
{
// Allocate memory for instance variables
  ArrayList<FireflyParticle> particles;
  PVector origin;

  FlyParticleSystem()
  {
    //Initiallizing ArrayList particles.
    //Particles should only consist of Particle objects.
    //origin = new PVector(x,y);
    particles = new ArrayList<FireflyParticle>();
  }
  
  int getLength()
  {
    return particles.size();
  }

//Adds a  Particle object to the ArrayList.
//I want to make it so that this only happens when the mouse is pressed.
//I tried a few different ways but they didn't work so I took them out.
//Any pointers?
  void addParticle() 
  {
    int life = int(random(200)+100);
    particles.add(new FireflyParticle(life));
  }

  void run()
  {
    //Checks the size of Arraylist and subtracts one 
    //(because the index starts at 0), then, as long as 
    //the size of particles is greater than 0 the for loop
    //will go through and check for particles who's transparency
    //is less than or equal to 0
    for(int i = particles.size()-1; i >= 0; i--) 
    {
      
      FireflyParticle p = particles.get(i);
      p.run();
      
      if(p.isDead())
      {
        particles.remove(i);
      }
    }
  }
}
