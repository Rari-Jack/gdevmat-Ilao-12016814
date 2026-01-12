void setup()
{
  size(1280, 720, P3D);
  background(255);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// stand in for "time"
float _t = 0;
Walker _perlinWalker = new Walker();

void draw()
{
  //float _n = noise(_t); // stand in for noise
  //float _x = map(_n, 0, 1, 0, 360);
  //rect(-640 + (_t * 100), -360, 1, _x);
  
  //_t += 0.01f;
  
  fill(0);
  noStroke();
  _perlinWalker.perlinWalk();
  _perlinWalker.render();
}
