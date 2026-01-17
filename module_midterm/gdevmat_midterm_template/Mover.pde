public class Mover
{
   public PVector position;
   public float scale = 50; 
   public float r = 255, g = 255, b = 255, a = 255; // color.
   
   Mover()
   {
      position = new PVector(); 
   }
   
   Mover(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   
   Mover(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   Mover(PVector position)
   {
      this.position = position; 
   }
   
   Mover(PVector position, float scale)
   {
      this.position = position; 
      this.scale = scale;
   }
   
   public void render()
   {
      noStroke(); // to replicate sir's blackhole simulation.
      fill(r,g,b,a);
      circle(position.x, position.y, scale); 
   }
   
   public void randomWalk()
   {
      float decision = random(0, 4);
      
      if (decision == 0)
      {
         position.x ++; 
      }
      else if (decision == 1)
      {
         position.x --; 
      }
      else if (decision == 2)
      {
         position.y ++; 
      }
      else if (decision == 3)
      {
         position.y --; 
      }
   }
   
   public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
   
   public void setRandomColor()
   {
     this.r = random(255);
     this.g = random(255);
     this.b = random(255);
     this.a = random(10, 100);
   }
   
   public void moveToPos(PVector target)
   {
     // from the instructions
     PVector _correctDirection = PVector.sub(target, position);
     
     // as instructed by sir.
     float _distance = _correctDirection.mag();
     _correctDirection.normalize();
     
     //
     
     // move towards the target (ie. blackhole)
     _correctDirection.mult(6); // increase the speed.
     position.add(_correctDirection);
     
     // as it gets closer to the target, decrease alpha channels.
     // like its getting sucked by the blackhole.
     a = map(_distance, 0, 100, 0, 255);
     a = constrain(a, 0, 255);
   }
}
