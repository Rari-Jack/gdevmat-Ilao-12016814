Liquid _ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker _testWalker = new Walker();

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    
    _testWalker._pos = new PVector(0, 300);
    _testWalker._g = 0;
    _testWalker._b = 0;
    _testWalker._mass = 5;
    _testWalker._size = _testWalker._mass * 10;
}

void draw()
{
    background(255);
    
    _ocean.render();
    _testWalker.render();
    _testWalker.update();
    
    PVector _gravity = new PVector(0, -0.25 * _testWalker._mass);
    _testWalker.applyForce(_gravity); // apply gravity to our walker.
    
    float _c = 0.1f;
    float _normal = 1;
    float _frictionMag = _c * _normal;
    PVector _friction = _testWalker._velo.copy();
    // F = -uNv
    _testWalker.applyForce(_friction.mult(-1).normalize().mult(_frictionMag)); // apply friction to walker.
    
    if (_testWalker._pos.y <= Window.bottom)
    {
      _testWalker._pos.y = Window.bottom;
      _testWalker._velo.y *= -1;
    }
    
    if (_ocean.isCollidingWith(_testWalker))
    {
      println("Colliding with the ocean.");
      PVector _dragForce = _ocean.calculateDragForce(_testWalker);
      _testWalker.applyForce(_dragForce);
    }
}
