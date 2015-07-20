package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Hat {
		private var costume:MovieClip;
		private var speed:int;
		private var rotationSpeed:int;
		
		public function Hat(parent:DisplayObjectContainer) {
			speed = Math.random() * 10 + 10;
			while (!rotationSpeed) {
				rotationSpeed = Math.random() * 20 - 10;
			}
			if (Math.abs(rotationSpeed) < 5) {
				rotationSpeed *= 2;
			}
			switch (int(Math.random() * 4)) {
				case 0: 
					costume = new hatFinish();
					break;
				case 1: 
					costume = new hatFinish1();
					break;
				case 2: 
					costume = new hatFinish2();
					break;
				case 3: 
					costume = new hatFinish3();
					break;
				default: 
					costume = new hatFinish3();
			}
			costume.x = Math.random() * 640;
			costume.y = Math.random() * 960 + 600;
			costume.scaleX = Math.random() / 3 + 0.7;
			costume.scaleY = costume.scaleX;
			parent.addChild(costume);
		}
		
		public function update():void {
			if (costume.y < -200) {
				remove();
			} else {
				costume.y -= speed;
				costume.rotation += rotationSpeed;
			}
		}
		
		public function remove():void {
			if (costume) {
				costume.parent.removeChild(costume);
				costume = null;
				HatsFalling.hatz.splice(HatsFalling.hatz.indexOf(this), 1);
			}
		}
	}
}