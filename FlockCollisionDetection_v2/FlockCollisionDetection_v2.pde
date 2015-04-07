ArrayList<Vehicle> vehicles;
Circle one, two;
Vehicle2 nomad;

void setup()
{
  one = new Circle(random(400)+200, random(400), random(150)+50, true);
  two = new Circle(random(400)+200, random(400), random(150)+100 , true);
  size(800,400);
  vehicles = new ArrayList<Vehicle>();
  nomad = new Vehicle2(width/2, height/2);
  for (int i = 0; i < 50; i++) 
  {
   vehicles.add(new Vehicle(random(width),random(height)));
  }
}

//I still have some issues avoiding things. I'm not sure if its because of the way it's being
//called here (which I thought I fixed by re-arranging the order of operations)
//or because there's something wrong with my avoid function (which is called in applyBehaviors())
//Honestly, I think it may be something about the loop?
//Maybe because there's a for loop inside the draw loop, it takes the vehicles longer
//to check how far away they are from Circle one and Circle two? 
//I really don't understand how only some vehicles move away within proximity as opposed to all..?
//If you observe for long enough you'll see that if a vehicle stays within the radius long enough, it will eventually
//push itself out. It's weird.

//Unfortunately, I don't think I was able to get this down.
//What I should have done was scrap the thing and restart sooner but by the time I realized
//that was the best course of action, it was too late. :/

void draw()
{
  background(0);
  nomad.wander();
  nomad.run();
  one.display();
  two.display();
  for(Vehicle yes : vehicles)
  {
    yes.display();
    yes.applyBehaviors(vehicles, nomad, one);
    yes.applyBehaviors(vehicles, nomad, two);
    yes.update();
    
    
  }
}

//This works 
void mousePressed()
{
  vehicles.add(new Vehicle(mouseX,mouseY));
}
