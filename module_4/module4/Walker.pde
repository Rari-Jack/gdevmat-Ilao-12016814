public class Walker
{
  public PVector _position = new PVector();
  public PVector _velocity = new PVector();
  public PVector _acceleration = new PVector();
  
  public float _velLimit = 10; // limit() limit mag of vector.
  public float _scale = 15;
  
  public Walker()
  {
     RandomizeWalkerValues();
  }
  
  // randomize position and scale.
  public void RandomizeWalkerValues()
  {
    // randomize walker positions.
     float _rngX = random(Window.left, Window.right);
     float _rngY = random(Window.bottom, Window.top);
  
    // set position.
     _position = new PVector(_rngX, _rngY);
     
     // set random scale.
     _scale = random(8, 20);
  }
  
  public void update()
  {
    // 2. Have them *accelerate* towards the direction of the mouse.
    PVector _mousePos = new PVector(mouseX - Window.windowWidth, -(mouseY - Window.windowHeight));
    PVector _newDirection = PVector.sub(_mousePos, _position); // get the direction.
    
    // seems like the inaccurate cursor bug can be fixed by adjusting it to the window width/height (by sir's window script).
    
    // normalize the direction
    _newDirection.normalize();
    
    // assign direction to accel
    _acceleration = _newDirection;

    // multiply it to 0.2
    _acceleration.mult(0.2);

    // apply everything.
    this._velocity.add(this._acceleration);
    this._velocity.limit(_velLimit);
    this._position.add(this._velocity);
  }
  
  public void render()
  {
    circle(_position.x, _position.y, _scale);
  }
  
  public void checkEdges()
  {
    if (this._position.x > Window.right)
    {
      this._position.x = Window.left;
    }
    
    else if (this._position.x < Window.left)
    {
      this._position.x = Window.right;
    }
    
    if (this._position.y > Window.top)
    {
      this._position.y = Window.bottom;
    }
    
    else if (this._position.y < Window.bottom)
    {
      this._position.y = Window.top;
    }
  }
}
