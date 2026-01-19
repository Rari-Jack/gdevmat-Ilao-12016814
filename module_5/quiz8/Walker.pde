public class Walker
{
  public PVector _position = new PVector();
  public PVector _velocity = new PVector();
  public PVector _acceleration = new PVector();
  
  public float _velocityLimit = 10;
  public float _scale = 15;
  
  public float _mass = 1;
  
  // colors
  float _r, _g, _b;
  
  public Walker()
  {
    
  }
  
  // Newton's Second Law of Motion.
  public void applyForce(PVector force)
  {
    PVector _newForce = PVector.div(force, this._mass);
    this._acceleration.add(_newForce); // force accumulation.
  }
  
  public void update()
  {
    //this._acceleration = PVector.random2D();  
    this._velocity.add(this._acceleration); // velocity accumulation.
    this._velocity.limit(_velocityLimit);
    this._position.add(this._velocity);
    this._acceleration.mult(0);
  }
  
  public void render()
  {
    fill(_r, _g, _b);
    circle(_position.x, _position.y, _scale);
  }
  
  public void selectRandomColor()
  {
    _r = random(0, 255);
    _g = random(0, 255);
    _b = random(0, 255);
  }
  
  public void checkEdges()
  {
    //if (this._position.x > Window.right)
    //{
    //  this._position.x = Window.left;
    //}
    
    //else if (this._position.x < Window.left)
    //{
    //  this._position.x = Window.right;
    //}
    
    //if (this._position.y > Window.top)
    //{
    //  this._position.y = Window.bottom;
    //}
    
    //else if(this._position.y < Window.bottom)
    //{
    //  this._position.y = Window.top;
    //}
    
    // 4. apply newton's third law (bounce)
    if (this._position.x > Window.right || this._position.x < Window.left)
    {
      _velocity.x *= -1;
    }
    
    if (this._position.y > Window.top || this._position.y < Window.bottom)
    {
      _velocity.y *= -1;
    }
  }
  
}
