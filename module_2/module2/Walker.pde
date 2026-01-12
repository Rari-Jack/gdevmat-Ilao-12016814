class Walker
{
  float _x;
  float _y;
  
  void render()
  {
    fill(random(255), random(255), random(255), random(50, 100));
    circle(_x, _y, 30);
  }
  
  void randomWalk()
  {
    int _rng = int(random(4));
    
    if (_rng == 0)
    {
      _y += 10;
    }
    
    else if (_rng == 1)
    {
      _y -= 10;
    }
    
    else if (_rng == 2)
    {
      _x += 10;
    }
    
    else if (_rng == 3)
    {
      _x -= 10;
    }
  }
  
  // modify sir's random walk function for quiz 2.
  void quiz2RandomWalk()
  {
    int _rng = int (random(4));
    
    if (_rng == 0)
    {
      _y += 10;
    }
    
    else if (_rng == 1)
    {
      _y -= 10;
    }
    
    else if (_rng == 2)
    {
      _x += 10;
    }
    
    else if (_rng == 3)
    {
      _x -= 10;
    }
    
    else if (_rng == 4)
    {
      _x += 10;
      _y += 10; // up right
    }
    
    else if (_rng == 5)
    {
      _x += 10; // down right
      _y -= 10; 
    }
    
    else if (_rng == 6)
    {
      _x -= 10;
      _y += 10; // up left
    }
    
    else if (_rng == 7)
    {
      _x -= 10;
      _y -= 10; // down left
    }
  }
  
  void randomWalkBiased()
  {
    float _rng = random(100);
    
    if (_rng < 40)
    {
      _x+= 10; // 40% right
    }
    
    else if (_rng < 60)
    {
      _x-= 10; // 20% left
    }
    
    else if (_rng < 80)
    {
      _y+= 10; // 20% up
    }
    
    else 
    {
      _y-= 10; // 20% down
    }
  }
}
