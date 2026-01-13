void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

//PVector _position = new PVector();
//PVector _speed = new PVector(5, 8);

Walker _testWalker = new Walker();

void draw()
{
  // white bg
  background(255);

  //// position multiplied by speed. use PVector.add func for a shortcut.
  //_position.add(_speed);
  
  //// bouncing conditions
  //if ((_position.x > Window.right || (_position.x < Window.left)))
  //{
  //  _speed.x *= -1;
  //}
  
  //if ((_position.y > Window.top || (_position.y < Window.bottom)))
  //{
  //  _speed.y *= -1;
  //}
  
  //fill(182, 52, 100);
  //circle(_position.x, _position.y, 50);
  
  _testWalker.moveAndBounce();
  _testWalker.render();
}
