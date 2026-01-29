public class Liquid
{
  public float _x, _y;
  public float _horizon, _depth;
  public float _cd;
  
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this._x = x;
    this._y = y;
    this._horizon = horizon;
    this._depth = depth;
    this._cd = cd;
  }
  
  public void render()
  {
    noStroke();
    fill(28, 120, 186);
    beginShape();
    vertex(_x - _horizon, _y, 0);
    vertex(_x + _horizon, _y, 0);
    vertex(_x + _horizon, _y + _depth, 0);
    vertex(_x - _horizon, _y + _depth, 0);
    endShape();
  }
  
  // checks if walker is colliding with liquid.
  public boolean isCollidingWith(Walker walker)
  {
    PVector _walkerPos = walker._pos;
    return _walkerPos.x > this._x - this._horizon &&
    _walkerPos.x < this._x + this._horizon &&
    _walkerPos.y < this._y;
  }
  
  public PVector calculateDragForce(Walker walker)
  {
    // drag magnitude is coefficient of drag * speed squared
    float _spd = walker._velo.mag();
    float _dragMag = this._cd * _spd * _spd;
    
    // direction is inverse of velocity
    PVector _dragForce = walker._velo.copy().mult(-1);
    
    // scale according to magnitude
    _dragForce.normalize();
    _dragForce.mult(_dragMag);
    
    return _dragForce;
  }
}
