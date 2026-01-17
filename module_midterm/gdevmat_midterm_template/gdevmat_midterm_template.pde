// global var
ArrayList<Mover> _matter = new ArrayList<Mover>();

Mover _blackHole;

// for resetting purposes.
int _frameCounter = 0;
int _resetAfter = 600;

void setup()
{
  size(1080, 720, P3D);
  background(0);
  
  // initialize blackHole
  _blackHole = new Mover(random(width), random(height), 100);
  _blackHole.setColor(255, 255, 255, 255);
  
  CreateMatter();
  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Mover mover = new Mover();
void draw()
{
  background(0);
  
  // the mouse cursor bonus. buggy as hell, i don't know why the window isn't accurate.
  _blackHole.position.set(mouseX, mouseY);
  
  // place matter.
  for (int i = 0; i < _matter.size(); i++)
  {
    _matter.get(i).moveToPos(_blackHole.position);
    _matter.get(i).render();
  }
  
  // render the blackhole.
  _blackHole.render();
  
  // reset the simulation.
  _frameCounter++;
  if (_frameCounter > _resetAfter)
  {
    Reset();
  }
}

public void CreateMatter()
{
  // gaussian spawn and for loop, as per said in the video and instructions.
  for (int i = 0; i < 100; i++)
  {
    float _randX = randomGaussian() * width/6 + width/2;
    float _randY = randomGaussian() * height/6 + height/2;
    
    float _randSize = random(25, 45);
    
    Mover _newMatter = new Mover(_randX, _randY, _randSize);
    _newMatter.setRandomColor();
    
    _matter.add(_newMatter);
  }
}

public void Reset()
{
  _matter.clear();
  
  // set new position.
  _blackHole.position.set(random(width), random(height));
  
  CreateMatter();
  
  _frameCounter = 0;
}
