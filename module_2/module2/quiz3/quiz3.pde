void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  doPaintSplatter();
}

void doPaintSplatter()
{
  // areas where the paint spawns (x axis)
  float _xGaussian = randomGaussian();
  float _xStandardDeviation = 200.0;
  float _xMean = 0;
  float _x = _xGaussian * _xStandardDeviation + _xMean;
  
  // random y position
  float _y = random(-height/2.0, height/2.0);
  
  // random sizes
  float _gaussianSize = randomGaussian();
  float _sizeStandardDeviation = 25.0;
  float _sizeMean = 1;
  float _diameter = _gaussianSize * _sizeStandardDeviation + _sizeMean;
  
  // random colors
  noStroke();
  fill(random(255), random(255), random(255), random(10, 100));
  circle(_x, _y, _diameter);
}
