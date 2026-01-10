// void start function, called at the start of the program
void setup()
{
  size(1280, 720, P3D); // set window size by 1080p
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

// void update equivalent. is called every frame. 
// treat it like void main()
void draw()
{
  background(0);

  drawCartesianPlane();
  drawQuizFunction1();
  drawQuizFunction2();
  drawSineWave();
}

// mga functions ni sir from mod 1
void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

// modify function for quiz function2
void drawLinearFunction()
{
  color white = color(255, 255, 255);
  fill(white);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, x + 2, 5);
  }
}

// use this as a template for the quiz function #1
void drawQuadraticFunction()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) + (x * 2) - 5, 5);
  }
}

void drawCircle()
{
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

//function 1 
void drawQuizFunction1()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    // the numbers, switch them to the numbers from the quiz function.
    circle(x * 10, (float)Math.pow(x, 2) - (x * 15) - 3, 5);
  }
}

//function 2
void drawQuizFunction2()
{
  color purple = color(128, 0, 128);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, -5 * x + 30, 5);
  }
}

void drawSineWave()
{
  // stroke change, genuinely don't know how to make it look like the screenshot.
  stroke(0, 0, 255);
  strokeWeight(0.8);
  float amplitude = 25;
  float frequency = 0.09;
  
  for (float x = -300; x <= 300; x += 0.001) 
  {
    float y = sin(x * frequency) * amplitude;
    circle(x, y, 6); 
  }
}
