o
//In this project, my idea is to create a cherry blossom tree
//whos petals fall and get blown in the direction of the mouse
//(having gravity pull it down at the same time. My second goal
//is to have fireflies spawn with a mouse click. They will exist
//for a short period of time before going out(the instance is 
//destroyed) and "steer" away from the pointer. Of course the 
//petals would exist as a particle system and same goes for the
//fireflies. 
//I will be recycling some code from our previous particle system
//assignment.

PetalSystem petals;
FlyParticleSystem fireflies;
//FireflyParticle firefly;
Tree cherryBlossom;
PVector gravity;
PVector wind;
float x;
int size;
int leaves;
Margin margin;

//Initializing most variables here.
void setup()
{
  size(800,400);
  
  petals = new PetalSystem();
  fireflies = new FlyParticleSystem();
  cherryBlossom = new Tree();
  gravity = new PVector(0,1);
  margin = new Margin();
}


void draw() 
{

  background(255);
  cherryBlossom.displayTree();
  
  if (mouseX < margin.getX())
  wind = new PVector(-.7,0);
  //float mousex = map(mouseX,0,800,0,800);
  //x = mousex;

  else if(mouseX > margin.getX())
  wind = new PVector(.7,0);
  //Me debugging below
  //System.out.println(x);
  leaves = petals.getLength();
  
  if(leaves<15)
  petals.addPetal(); 
  
  wind.add(gravity);
  //petals.applyForce(gravity, wind);
  petals.applyForce(wind);
  petals.run();
  
  size = fireflies.getLength();
  
  if(size<10)
  fireflies.addParticle(); 
  
  fireflies.run();  
}
