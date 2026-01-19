Walker[] _walkers = new Walker[8]; // variable for walkers.

PVector _acceleration = new PVector(0.2, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // create the walkers.
  CreateWalkers();
}

void draw()
{
  background(255);

  // for debugging purposes.
  stroke(0, 0, 0);
  strokeWeight(3);
  line(0, Window.top, 0, Window.bottom);

  for (Walker _w : _walkers)
  {
    // initialize friction
    float _mew = 0.01f;
    
    // past midpoint
    if (_w._position.x > 0)
    {
      _mew = 0.4f;
    }
    
    // Apply the friction in the beginning, not when it just hits the midpoint
    if (_w._velocity.mag() > 0)
    {
      PVector _friction = _w._velocity.copy();
      _friction.mult(-1);
      _friction.normalize();
      _friction.mult(_mew);
      _w.applyForce(_friction);
    }
    
    // apply it to all walkers
    _w.applyForce(_acceleration);
    
    _w.update();
    _w.checkEdges();
    _w.render();
  }
}

void CreateWalkers()
{
  // initialize walkers.
  for (int i = 0; i < _walkers.length; i++)
  {
    _walkers[i] = new Walker();
    
    // increase mass and scale
    _walkers[i]._mass = i + 1;
    _walkers[i]._scale = _walkers[i]._mass * 15;
    
    // position them from top to bottom (use an equation similar in the video)
    float _posY = 2 * (Window.windowHeight / _walkers.length / 2) * (i * _walkers.length / 4);
    _walkers[i]._position = new PVector(Window.left - 100, -_posY + 320);
    
    // random colors
    _walkers[i].selectRandomColor();
  }
}

void mousePressed()
{
  CreateWalkers();
}
