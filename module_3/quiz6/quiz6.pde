void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float _x = mouseX - Window.windowWidth / 2;
  float _y = -(mouseY - Window.windowHeight / 2);
  return new PVector(_x, _y);
}

void draw()
{
  background(130);
  
  //strokeWeight(15);
  //stroke(255, 0, 0);
  
  //PVector _mousePos = mousePos();
  
  ////_mousePos.mult(2);
  //_mousePos.normalize().mult(500);
  //line(0, 0, _mousePos.x, _mousePos.y);
  
  PVector _mousePos = mousePos();
  _mousePos.normalize().mult(500);
  PVector _mousePosOpposite = new PVector(-_mousePos.x, -_mousePos.y);
  
  // print mag
  println("Magnitude: " + _mousePos.mag());
  
  // outer glow
  strokeWeight(30);
  stroke(255, 0, 0, 80); // red
  line(0, 0, _mousePos.x, _mousePos.y); // direction of the saber
  line(0, 0, _mousePosOpposite.x, _mousePosOpposite.y);
  
  // inner glow
  strokeWeight(5);
  stroke(255);
  line(0, 0, _mousePos.x, _mousePos.y);
  line(0, 0, _mousePosOpposite.x, _mousePosOpposite.y);
  
  // black handle
  strokeWeight(15);
  stroke(0); // black handle, like the image
  line(0, 0, _mousePos.x * 0.15, _mousePos.y * 0.15);
}
