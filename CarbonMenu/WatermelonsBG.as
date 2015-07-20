package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class WatermelonsBG {
		private var cam1:Camera;
		private var cam2:Camera;
		private var cam3:Camera;
		private var cam4:Camera;
		private var cam5:Camera;
		
		public static var backgroundWM:MovieClip;
		
		public function WatermelonsBG(parent:DisplayObjectContainer) {
			backgroundWM = new MovieClip();
			parent.addChild(backgroundWM);
			cam1 = new Camera(1, 0.5);
			cam2 = new Camera(1, 0.6);
			cam3 = new Camera(0.7, 0.2);
			cam4 = new Camera(0.6, 0.3);
			cam5 = new Camera(0.5, 0.7);
			var wm1:MovieClip = new big_bg_wm2();
			wm1.x = -100;
			wm1.y = -200;
			var wm2:MovieClip = new big_bg_wm();
			wm2.x = -300;
			wm2.y = 100;
			wm2.rotation = 75;
			var wm5:MovieClip = new big_bg_wm2();
			wm5.x = 300;
			wm5.y = -200;
			wm5.rotation = 220;
			var wm3:MovieClip = new big_bg_wm2();
			wm3.x = 50;
			wm3.y = 200;
			wm3.rotation = 90;
			var wm4:MovieClip = new big_bg_wm();
			wm4.x = -100;
			wm4.y = -100;
			cam1.addChild(wm1);
			cam2.addChild(wm3);
			cam3.addChild(wm2);
			cam4.addChild(wm5);
			cam5.addChild(wm4);
			backgroundWM.addChild(cam1);
			backgroundWM.addChild(cam2);
			backgroundWM.addChild(cam3);
			backgroundWM.addChild(cam4);
			backgroundWM.addChild(cam5);
		}
		
		public function update(y:Number):void {
			cam1.zoomTo(new Point(0, y), 1);
			cam2.zoomTo(new Point(0, y), 1);
			cam3.zoomTo(new Point(0, y), 1);
			cam4.zoomTo(new Point(0, y), 1);
			cam5.zoomTo(new Point(0, y), 1);
			cam1.rotation = y / 30 / cam1.ZOOM;
			cam2.rotation = -y / 30 / cam2.ZOOM;
			cam3.rotation = y / 30 / cam3.ZOOM;
			cam4.rotation = -y / 30 / cam4.ZOOM;
			cam5.rotation = y / 30 / cam5.ZOOM;
		}
	}
}