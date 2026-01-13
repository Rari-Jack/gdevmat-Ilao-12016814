class Walker
{
  PVector _pos = new PVector();
  PVector _spd = new PVector(5, 8);
  
  void render()
  {
    fill(random(255), random(255), random(255), random(50, 100));
    circle(_pos.x, _pos.y, 50);
  }
  
  // CONVERT ANY EXISTING FUNCTION WITH THE NEW VARIABLES
  void randomWalk()
  {
    int _rng = int(random(4));

    if (_rng == 0) _pos.y += 10;
    else if (_rng == 1) _pos.y -= 10;
    else if (_rng == 2) _pos.x += 10;
    else if (_rng == 3) _pos.x -= 10;
  }

  void randomWalkBiased()
  {
    float _rng = random(100);

    if (_rng < 40) _pos.x += 10;
    else if (_rng < 60) _pos.x -= 10;
    else if (_rng < 80) _pos.y += 10;
    else _pos.y -= 10;
  }
  
  // the function for quiz 5
  void moveAndBounce()
  {
    _pos.add(_spd);
    
    if (_pos.x > Window.right || _pos.x < Window.left)
    {
      _spd.x *= -1;
    }
    
    if (_pos.y > Window.top || _pos.y < Window.bottom)
    {
      _spd.y *= -1;
    }
  }
}
