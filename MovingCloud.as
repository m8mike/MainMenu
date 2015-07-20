package {
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MovingCloud extends MovieClip {
		private var costume:MovieClip;
		private var a:Point;
		private var b:Point;
		public var positionPercent:int = 0;
		public var moving:Boolean = true;
		
		public function MovingCloud(pointA:Point, pointB:Point, scale:int) {
			a = pointA;
			b = pointB;
			costume = new cloud_single();
			costume.scaleX = scale;
			costume.scaleY = scale;
			addChild(costume);
			x = a.x;
			y = a.y;
		}
		
		public function moveIn():Boolean {
			if (positionPercent < 100) {
				positionPercent++;
				x = (b.x - a.x) / 100 * positionPercent + a.x;
				y = (b.y - a.y) / 100 * positionPercent + a.y;
			} else {
				moving = false;
			}
			return moving;
		}
		
		public function moveOut():Boolean {
			if (positionPercent > 0) {
				positionPercent--;
				x = (b.x - a.x) / 100 * positionPercent + a.x;
				y = (b.y - a.y) / 100 * positionPercent + a.y;
			} else {
				moving = false;
			}
			return moving;
		}
		
		public function setIn():void {
			x = b.x;
			y = b.y;
			positionPercent = 0;
		}
		
		public function setOut():void {
			x = a.x;
			y = a.y;
			positionPercent = 100;
		}
		
		public function remove():void {
			costume.parent.removeChild(costume);
			costume = null;
			parent.removeChild(this);
		}
	}
}