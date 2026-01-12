public class Walker{
  public float _x;
  public float _y;
  public float _tx = 0, _ty = 10000;
  
  // perlin size
  public float _tSize = 20000;
  
  // perlin colors
  public float _tr = 30000;
  public float _tg = 40000;
  public float _tb = 50000;
  
  void render()
  {
    // perlin size usage
    float _sizeNoise = noise(_tSize);
    float _diameter = map(_sizeNoise, 0, 1, 5, 150); // map the values from 5 to 150.
    
    // perlin colors in variables  2
    float _perlinR = map(noise(_tr), 0, 1, 0, 255);
    float _perlinG = map(noise(_tg), 0, 1, 0, 255);
    float _perlinB = map(noise(_tb), 0, 1, 0, 255);
    
    // fill in the colors and the size for the circles.
    fill(_perlinR, _perlinG, _perlinB);
    circle(_x, _y, _diameter);

    // randomize size & colors
    _tSize += 0.01f;
    _tr += 0.01f;
    _tg += 0.01f;
    _tb += 0.01f;
  }
  
  void perlinWalk()
  {
    _x = map(noise(_tx), 0, 1, -640, 640);
    _y = map(noise(_ty), 0, 1, -360, 360);
    
    // randomize positions
    _tx += 0.03f;
    _ty += 0.03f;
  }
}
