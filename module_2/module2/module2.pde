void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0/180.0), 0, 0, 0, 0, -1, 0);
}

Walker _testWalker = new Walker(); // walker instance

// for quiz2 and the new functions.
Walker _testWalker2 = new Walker();
Walker _testWalker3 = new Walker();

void draw()
{
  // commented out para sa quiz 2 functions
  //int _rng = int(5); // random value from 0 - 5
  //println(_rng); // debug.log line equiv
  
  // walker 1 uses normal randWalk, walker 2 uses randomwalk, walker 3 uses randomwalkbiased
  _testWalker.randomWalk();
  _testWalker.render();
  
  _testWalker2.quiz2RandomWalk();
  _testWalker2.render();
  
  _testWalker3.randomWalkBiased();
  _testWalker3.render();
}
