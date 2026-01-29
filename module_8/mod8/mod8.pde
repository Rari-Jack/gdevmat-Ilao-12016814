Walker _bigMatter = new Walker();
Walker _smallMatter = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  _bigMatter._pos = new PVector();
  _bigMatter._mass = 20;
  _bigMatter._size = _bigMatter._mass * 10;
  
  _smallMatter._pos = new PVector(150, 150);
  _smallMatter._mass = 10;
  _smallMatter._size = _smallMatter._mass * 10;
}

void draw()
{
  background(255);
  
  _bigMatter.update();
  _bigMatter.render();
  
  _smallMatter.update();
  _smallMatter.render();
  
  _smallMatter.applyForce(_bigMatter.calculateAttraction(_smallMatter));
  _bigMatter.applyForce(_smallMatter.calculateAttraction(_bigMatter));
}
