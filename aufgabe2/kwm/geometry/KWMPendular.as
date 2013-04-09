package kwm.geometry
{
	public class KWMPendular
	{
		public var size:int;
		public var origin:Point2D;
		public var _color:uint;
		public var rotation:int;
		
		public var square: KWMDiamond;
		public var diamond: KWMDiamond;
		public var line: Line2D;
		public var circle: Point2D;
		
		public function KWMPendular(size:int, origin:Point2D, color:uint = 0x000000)
		{
			this.size = size;
			this.color = color;
			this.origin = origin;
			
			generatePendular();
		}
		
		public function generatePendular() : void
		{
			var squareOrigin: Point2D = new Point2D(origin.x - size * 0.425, origin.y);
			var diamondOrigin: Point2D= new Point2D(origin.x + size * 0.40, origin.y);
			
			squareOrigin.rotate(origin, rotation);
			diamondOrigin.rotate(origin, rotation);
			
			this.square = new KWMDiamond(0.15 * size * 1.414, 0.15 * size * 1.414, squareOrigin, 45); //mal 1.414 (Wurzel aus 2) Aufgrund der Rotation
			this.diamond = new KWMDiamond(0.20 * size, 0.15 * size, diamondOrigin);
			
			this.line = new Line2D(square.origin.x, square.origin.y, diamond.origin.x, diamond.origin.y);
			this.circle = new Point2D(origin.x + (size * 0.25), origin.y);
			
			//this.line.rotate(origin, rotation);
			this.circle.rotate(origin, rotation);
			
			this.square.rotation = rotation;
			this.diamond.rotation = rotation;
		}
		

		public function draw() : void
		{
			this.square.draw(color);
			this.diamond.draw(color);
			this.circle.draw(color, size * 0.05);
			this.line.draw(color, size * 0.02);
		}
		
		public function resize (f:Number) : void
		{
			size = size * f;
			generatePendular();
		}
		
		public function move (dx:int, dy:int):void
		{
			origin = new Point2D(dx, dy);
			generatePendular();
		}
		
		public function rotate (degree:int):void
		{
			rotation = degree;
			generatePendular();
		}
		
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
		}

	}
}