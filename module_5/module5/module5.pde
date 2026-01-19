Walker _walker = new Walker();
Walker _heavyWalker = new Walker();

PVector _wind = new PVector(0.01, 0);
PVector _gravity = new PVector(0, -0.1);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  _walker._mass = 2;
  _walker._scale = _walker._mass * 15; 
  
  _heavyWalker._position.y = -50;
  _heavyWalker._mass = 2;
}

void draw()
{
  background(80);
  _walker.render();
  _walker.update();
  _walker.applyForce(_gravity);
  _walker.applyForce(_wind);
  
  if (_walker._position.y <= Window.bottom)
  {
    _walker._velocity.y *= -1; // Newton's 3rd law of Motion.
  }
  
  //_heavyWalker.render();
  //_heavyWalker.update();
  //_heavyWalker.applyForce(_gravity);
}
