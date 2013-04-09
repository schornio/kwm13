package kwm.geometry{
  import kwm.Drawing;
  
  public class Line2D{
    public var _first:Point2D;
    public var _second:Point2D;
    
    
    public function Line2D(x0:int, y0:int, x1:int, y1:int){
      this._first = new Point2D(x0, y0);
      this._second = new Point2D(x1, y1);
    }
    
    public function get first():Point2D{
      return this._first;
    }
    
    public function set first(p:Point2D):void{
      this._first = p;
    }
    
    public function get second():Point2D{
      return this._second;
    }
    
    public function set second(p:Point2D):void{
      this._second = p;
    }
    
    public function draw(c:uint = 0x000000, thickness:uint = 1):void{
      Drawing.graphics.lineStyle(thickness, c);
      Drawing.graphics.moveTo(this.first.x,this.first.y);
      Drawing.graphics.lineTo(this.second.x, this.second.y);
    }
	
	public function rotate(origin:Point2D, degree:int) : void {
		first.rotate(origin, degree);
		second.rotate(origin, degree);
	}
  }
}