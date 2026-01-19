//Walker _testWalker = new Walker();
ArrayList<Walker> _walkers = new ArrayList<Walker>(); // initialize walker list.

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // create the walkers.
  for (int i = 0; i < 100; i++)
  {
    _walkers.add(new Walker());
  }
}

/* Vector Motion #1

1. Add velocity to position.
2. Draw the object at position.

*/

void draw()
{
  background(80);
  
  //_testWalker.update();
  //_testWalker.render();
  //_testWalker.checkEdges();
  
  // for each walker, update their coordinates.
  for (int i = 0; i < _walkers.size(); i++)
  {
    _walkers.get(i).update();
    _walkers.get(i).render();
    _walkers.get(i).checkEdges();
  }
}
