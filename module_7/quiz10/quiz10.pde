Liquid _ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker _testWalker = new Walker();

// Create 10 walkers.
Walker[] _walkers = new Walker[10];

// Apply 3 forces to all walkers
PVector _wind = new PVector(0.1, 0); // wind.

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    //_testWalker._pos = new PVector(0, 300);
    //_testWalker._g = 0;
    //_testWalker._b = 0;
    //_testWalker._mass = 5;
    //_testWalker._size = _testWalker._mass * 10;
    
    // spaced out equally side by side.
    float _spacing = (Window.right - Window.left) / (float)_walkers.length;
    
    for (int i = 0; i < _walkers.length; i++)
    {
      _walkers[i] = new Walker();
      
      // spaced.
      float _x = Window.left + _spacing * i + _spacing/2;
      
      // adjust this if you think walker is too high/low
      float _y = Window.top + 50;
      
      _walkers[i]._pos = new PVector(_x, _y);
      
      // random mass.
      _walkers[i]._mass = random(1, 8);
      
      // scaled out according to mass. adjust kung maliit masyado.
      _walkers[i]._size = _walkers[i]._mass * 15;
      
      // random colors;
      _walkers[i]._r = random(255);
      _walkers[i]._g = random(255);
      _walkers[i]._b = random(255);
    }
}

void draw()
{
    background(255);
    
    _ocean.render();
    
    //_testWalker.render();
    //_testWalker.update();
    
    //PVector _gravity = new PVector(0, -0.25 * _testWalker._mass);
    //_testWalker.applyForce(_gravity); // apply gravity to our walker.
    
    //float _c = 0.1f;
    //float _normal = 1;
    //float _frictionMag = _c * _normal;
    //PVector _friction = _testWalker._velo.copy();
    //// F = -uNv
    //_testWalker.applyForce(_friction.mult(-1).normalize().mult(_frictionMag)); // apply friction to walker.
    
    //if (_testWalker._pos.y <= Window.bottom)
    //{
    //  _testWalker._pos.y = Window.bottom;
    //  _testWalker._velo.y *= -1;
    //}
    
    //if (_ocean.isCollidingWith(_testWalker))
    //{
    //  println("Colliding with the ocean.");
    //  PVector _dragForce = _ocean.calculateDragForce(_testWalker);
    //  _testWalker.applyForce(_dragForce);
    //}
    
    // foreach loop.
    for (Walker w : _walkers)
    {
      // gravity (scaled out according to mass) (0, -0.15f * mass)
      PVector _gravity = new PVector(0, -0.15f * w._mass);
      
      // Apply three forces to all walkers
      w.applyForce(_gravity);
      w.applyForce(_wind);
      
      if (w._pos.y <= Window.bottom)
      {
        w._pos.y = Window.bottom;
        w._velo.y *= -1;
      }
      
      // drag if walker is inside ocean
      if (_ocean.isCollidingWith(w))
      {
        PVector _drag = _ocean.calculateDragForce(w);
        w.applyForce(_drag);
      }
      
      w.update();
      w.render();
    }
}
