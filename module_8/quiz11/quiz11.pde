//Walker _bigMatter = new Walker();
//Walker _smallMatter = new Walker();

// Create 10 walkers.
Walker[] _walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //_bigMatter._pos = new PVector();
  //_bigMatter._mass = 20;
  //_bigMatter._size = _bigMatter._mass * 10;
  
  //_smallMatter._pos = new PVector(150, 150);
  //_smallMatter._mass = 10;
  //_smallMatter._size = _smallMatter._mass * 10;
  
  for (int i = 0; i < _walkers.length; i++)
  {
    _walkers[i] = new Walker();
    
    // random colors, mass, scale, positions
    _walkers[i]._r = random(255);
    _walkers[i]._g = random(255);
    _walkers[i]._b = random(255);
    _walkers[i]._a = random(255);
    
    _walkers[i]._mass = random(5, 25);
    _walkers[i]._size = _walkers[i]._mass * 4;
    
    float _rngX = random(Window.left, Window.right);
    float _rngY = random(Window.bottom, Window.top);
    _walkers[i]._pos = new PVector(_rngX, _rngY);
  }
}

void draw()
{
  background(255);
  
  //_bigMatter.update();
  //_bigMatter.render();
  
  //_smallMatter.update();
  //_smallMatter.render();
  
  //_smallMatter.applyForce(_bigMatter.calculateAttraction(_smallMatter));
  //_bigMatter.applyForce(_smallMatter.calculateAttraction(_bigMatter));
  
  for (int i = 0; i < _walkers.length; i++)
  {
    _walkers[i].update();
    _walkers[i].render();
  }
  
  // sir's hint = Write two nested for loops to compute for each walker's attraction to every other walker in your program's existence
  for (int i = 0; i < _walkers.length; i++)
  {
    for (int j = 0; j < _walkers.length; j++)
    {
      if (i != j)
      {
        PVector _force = _walkers[j].calculateAttraction(_walkers[i]);
        _walkers[i].applyForce(_force);
      }
    }
  }
}
