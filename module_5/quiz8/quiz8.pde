Walker _walker = new Walker();
Walker _heavyWalker = new Walker();

// 1. Declare and initialize 10 Walker objects in an array
Walker[] _walkers = new Walker[10];

// 2. declare and initialize 2 forces (gravity = (0, -0.4), wind = (0.15, 0))
PVector _wind = new PVector(0.15, 0);
PVector _gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //_walker._mass = 2;
  //_walker._scale = _walker._mass * 15; 
  
  //_heavyWalker._position.y = -50;
  //_heavyWalker._mass = 2;
  
  // 1. Do the initialization in void setup()
  for (int i = 0; i < _walkers.length; i++)
  {
    _walkers[i] = new Walker();
    
    // mass from 1 to 10
    _walkers[i]._mass = i + 1;
    
    // scale depends on mass.
    _walkers[i]._scale = _walkers[i]._mass * 15;
    
    // start pos
    _walkers[i]._position = new PVector(-500, 200);
    
    // each walker must have random color
    _walkers[i].selectRandomColor();
  }
}

void draw()
{
  background(80);
  //_walker.render();
  //_walker.update();
  //_walker.applyForce(_gravity);
  //_walker.applyForce(_wind);
  
  //if (_walker._position.y <= Window.bottom)
  //{
  //  _walker._velocity.y *= -1; // Newton's 3rd law of Motion.
  //}
  
  //_heavyWalker.render();
  //_heavyWalker.update();
  //_heavyWalker.applyForce(_gravity);
  
  for (int i = 0; i < _walkers.length; i++)
  {
    _walkers[i].applyForce(_gravity);
    _walkers[i].applyForce(_wind);
    
    _walkers[i].update();
    _walkers[i].checkEdges();
    _walkers[i].render();
  }
}
