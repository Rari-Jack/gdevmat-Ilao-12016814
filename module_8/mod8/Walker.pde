public class Walker
{
  public PVector _pos = new PVector();
  public PVector _velo = new PVector();
  public PVector _accel = new PVector();
  
  public float _veloLimit = 10;
  public float _size = 15;
  
  public float _mass = 1;
  
  public float _r = 255, _g = 255, _b = 255, _a = 255;
  
  public float _graviConstant = 1;
  
  public Walker()
  {
    
  }
  
  // Newton's Second Law of Motion.
  public void applyForce(PVector force)
  {
    PVector _f = PVector.div(force, this._mass);
    this._accel.add(_f); // force accumulation.
  }
  
  public void update()
  {
    this._velo.add(this._accel);
    this._velo.limit(_veloLimit);
    this._pos.add(this._velo);
    this._accel.mult(0);
  }
  
  public void render()
  {
    fill(_r, _g, _b, _a);
    circle(_pos.x, _pos.y, _size);
  }
  
  public void checkEdges()
  {
    if (this._pos.x > Window.right)
    {
       this._pos.x = Window.left; 
    }
    
    else if (this._pos.x < Window.left)
    {
       this._pos.x = Window.right; 
    }
    
    if (this._pos.y > Window.top)
    {
       this._pos.y = Window.bottom;       
    }
    
    else if (this._pos.y < Window.bottom)
    {
       this._pos.y = Window.top;       
    }
  }
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector _force = PVector.sub(this._pos, walker._pos); // direction
    float _distance = _force.mag();
    _force.normalize(); // normalize to accurately get direction.
    
    _distance = constrain(_distance, 5, 25); // solves divide by 0, and divide by really tiny values
    
    float _strength = (this._graviConstant * this._mass * walker._mass) / (_distance * _distance);
    _force.mult(_strength);
    return _force;
  }
}
