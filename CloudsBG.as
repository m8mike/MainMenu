package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CloudsBG extends MovieClip {
		private var clouds:Array = [];
		public var moving:Boolean = false;
		private var executeMe:Function;
		
		public function CloudsBG() {
			
		}
		
		public function add():void {
			for (var i:int = 0; i < 4; i++) {
				for (var j:int = 0; j < 6; j++) {
					var a:Point = new Point();
					a.x = i * 300 - 150 * (j % 2) * Math.random();
					a.y = j * 100;
					var b:Point = a.clone();
					var random:Number = Math.random()
					a.x += random > 0.5 ? (900 + random * 2000) : (0 - 1900 - random * 5000);
					var scale:int = Math.random() * 1.5 + 1;
					clouds.push(new MovingCloud(a, b, scale));
				}
			}
			for each(var cloud:MovingCloud in clouds) {
				addChild(cloud);
			}
		}
		
		public function setIn():void {
			for each(var cloud:MovingCloud in clouds) {
				cloud.setIn();
				cloud.positionPercent = 100;
				cloud.moving = true;
			}
		}
		
		public function setOut():void {
			for each(var cloud:MovingCloud in clouds) {
				cloud.setOut();
				cloud.positionPercent = 0;
				cloud.moving = true;
			}
		}
		
		public function getPosition():int {
			return MovingCloud(clouds[0]).positionPercent;
		}
		
		public function appear(fun:Function = null):void {
			setOut();
			addEventListener(Event.ENTER_FRAME, moveIn);
			moving = true;
			executeMe = fun;
		}
		
		public function disappear():void {
			setIn();
			addEventListener(Event.ENTER_FRAME, moveOut);
			moving = true;
		}
		
		private function moveIn(e:Event):void {
			trace("in" + MovingCloud(clouds[0]).positionPercent);
			for each(var cloud:MovingCloud in clouds) {
				if (!cloud.moveIn()) {
					removeEventListener(Event.ENTER_FRAME, moveIn);
					moving = false;
				}
			}
		}
		
		private function moveOut(e:Event):void {
			trace("out" + MovingCloud(clouds[0]).positionPercent);
			for each(var cloud:MovingCloud in clouds) {
				if (!cloud.moveOut()) {
					removeEventListener(Event.ENTER_FRAME, moveOut);
					moving = false;
					if (executeMe!=null) {
						executeMe();
						executeMe = null;
					}
				}
			}
		}
		
		public function remove():void {
			while (clouds.length) {
				clouds[0].remove();
				clouds.splice(0, 1);
			}
		}
	}
}