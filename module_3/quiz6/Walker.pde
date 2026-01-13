public class Walker
{
  public PVector _pos = new PVector();
  public float _scale = 15;
  
  public Walker(){}
  
  public void render()
  {
    circle(_pos.x, _pos.y, _scale);
  }
}
