package kwm.geometry{
  import kwm.Drawing;
  
  public class Point2D{
    public var xCoordinate:int;
    public var yCoordinate:int;
    
    public function Point2D(x:int, y:int){
      this.xCoordinate = x;
      this.yCoordinate = y;
    }
    
    public function get x():int{
      return this.xCoordinate;
    }
    
    public function get y():int{
      return this.yCoordinate;
    }
    
    public function moveTo(x:int, y:int):void{
      this.xCoordinate = x;
      this.yCoordinate = y;
    }
    
    public function movePointBy(dx:int, dy:int):void{
      this.xCoordinate += dx; 
      this.yCoordinate += dy;
    }
    
    public function draw(c:uint = 0x000000, r:uint = 1):void{
      Drawing.graphics.beginFill(c);
      Drawing.graphics.drawCircle(x, y, r);
      Drawing.graphics.endFill();
    }
    
    public function distance(p:Point2D):int{
      var dx:int = this.x - p.x;
      var dy:int = this.y - p.y;
      
      var result:int = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
      return result;
    }
	
	public function rotate(origin:Point2D, degree:int) : void 
	{
		var beta:Number; 
		// Behandlung von Sonderfällen
		if (this.x == origin.x) 
		{
			if (this.y == origin.y) 
				return; // this und origin sind identisch
			else 
			{
				if (this.y < origin.y)
					beta = 3 * Math.PI/2; // setzen auf 270°
				else
					beta = Math.PI/2; // setzen auf 90°
			}
		}
		else 
		{
			beta = Math.atan((this.y - origin.y)/(this.x -
				origin.x)); 
			if (this.x < origin.x) 
				beta = beta + Math.PI; 
		}
		var alpha:Number = degree * Math.PI / 180; // Umrechnung von Grad auf Radiant
		var d:Number = Math.sqrt(Math.pow(this.x - origin.x, 2) + 
			Math.pow(this.y - origin.y,2)); // Berechnung des Abstands zum Ursprung
		var x_new:int = d * Math.cos(alpha + beta) + origin.x; 
		var y_new:int = d * Math.sin(alpha + beta) + origin.y; 
		this.moveTo(x_new, y_new); // setzen der Koordinaten von x & y, alternativ (falls in der UE so verwendet, „movePointTo“)
	}
  }
}