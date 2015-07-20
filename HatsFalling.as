package {
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class HatsFalling {
		public static var hatz:Array = [];
		private var allowHats:Boolean = true;
		private var hatsFalling:Boolean = false;
		private var parent:DisplayObjectContainer;
		
		public function HatsFalling(parent:DisplayObjectContainer) {
			this.parent = parent;
			parent.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void {
			if (allowHats) {
				if (hatz.length < 10) {
					hatz.push(new Hat(parent));
					hatsFalling = true;
				}
				if (hatz.length) {
					hatsFalling = true;
				} else {
					hatsFalling = false;
				}
			} else if (!hatsFalling) {
				parent.removeEventListener(Event.ENTER_FRAME, update);
				return void;
			}
			if (hatsFalling){
				for each(var hat:Hat in hatz) {
					hat.update();
				}
			}
		}
		
		public function drop():void {
			allowHats = true;
		}
		
		public function stop():void {
			allowHats = false;
		}
		
		public function remove():void {
			while (hatz.length) {
				Hat(hatz[0]).remove();
				hatz.splice(0, 1);
			}	
		}
	}
}