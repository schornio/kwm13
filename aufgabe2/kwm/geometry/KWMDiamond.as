package kwm.geometry
{
	import kwm.*; //deleteme
	
	public class KWMDiamond
	{
		public var _width:int;
		public var _height:int;
		public var _origin:Point2D;
		public var _rotation:int;
		
		public var a_vertex:Point2D;
		public var b_vertex:Point2D;
		public var c_vertex:Point2D;
		public var d_vertex:Point2D;
		
		public function KWMDiamond(width:int, height:int, origin: Point2D, rotation:int = 0)
		{
			this._width = width;
			this._height = height;
			this._origin = origin;
			this._rotation = rotation;
			
			generateVertex();
			rotate();
		}
		
		public function generateVertex() : void
		{
			a_vertex = new Point2D(origin.x, origin.y - (height / 2));
			b_vertex = new Point2D(origin.x + (width / 2), origin.y);
			c_vertex = new Point2D(origin.x, origin.y + (height / 2));
			d_vertex = new Point2D(origin.x - (width / 2), origin.y);
		}
		
		public function rotate() : void 
		{
			a_vertex.rotate(origin, rotation);
			b_vertex.rotate(origin, rotation);
			c_vertex.rotate(origin, rotation);
			d_vertex.rotate(origin, rotation);
		}
		
		public function draw(color:uint = 0x000000) : void
		{
			Drawing.graphics.lineStyle(0, color);
			Drawing.graphics.beginFill(color);
			
			Drawing.graphics.moveTo(a_vertex.x, a_vertex.y);
			Drawing.graphics.lineTo(b_vertex.x, b_vertex.y);
			Drawing.graphics.lineTo(c_vertex.x, c_vertex.y);
			Drawing.graphics.lineTo(d_vertex.x, d_vertex.y);
			Drawing.graphics.lineTo(a_vertex.x, a_vertex.y);
			
			Drawing.graphics.endFill();
		}

		public function get rotation():int
		{
			return _rotation;
		}

		public function set rotation(value:int):void
		{
			_rotation = value;
			rotate();
		}

		public function get origin():Point2D
		{
			return _origin;
		}

		public function set origin(value:Point2D):void
		{
			_origin = value;
			generateVertex();
		}

		public function get height():int
		{
			return _height;
		}

		public function set height(value:int):void
		{
			_height = value;
			generateVertex();
		}

		public function get width():int
		{
			return _width;
		}

		public function set width(value:int):void
		{
			_width = value;
			generateVertex();
		}

	}
}