package
{
	import kwm.geometry.*;

	public class TestKWMPendular
	{
		public static function main() : void 
		{	
			var pendular: KWMPendular = new KWMPendular(300, new Point2D(150,15));
			
			pendular.color = 0xFF00FF;
			pendular.draw();
			
			pendular.color = 0x00FFFF;
			pendular.resize(0.75);
			pendular.draw();
			
			pendular.color = 0xFFFF00;
			pendular.move(200, 100);
			pendular.draw();
			
			pendular.color = 0x00FF00;
			pendular.rotate(60);
			pendular.draw();
		}
	}
}