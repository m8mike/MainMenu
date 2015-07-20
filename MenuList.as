package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MenuList {
		private static var current:int;
		public static var items:Array = [];
		public static var pressed:int = -1;
		
		public function MenuList(parent:DisplayObjectContainer, remove:Function, hide:Function, achieve:Function, complete:Function) {
			items.push(new MenuItem("Play", parent, remove));
			items.push(new MenuItem("Settings", parent, hide));
			items.push(new MenuItem("Achievements", parent, achieve));
			items.push(new MenuItem("Credits", parent, complete));
			setCurrent(0);
		}
		
		public static function setCurrent(index:int):void {
			if (pressed != -1) return void;
			for each (var i:MenuItem in items) {
				i.makeWhite();
			}
			current = index;
			MenuItem(items[current]).makeGreen();
		}
		
		public function unpress(e:MouseEvent):void {
			if (pressed != -1) {
				MenuItem(items[pressed]).itemText.x -= 4;
				MenuItem(items[pressed]).itemText.y -= 4;
				pressed = -1;
			}
		}
		
		public function controlMenu(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 38: //Up
					if (current == 0) {
						setCurrent(items.length - 1);
					} else {
						setCurrent(current - 1);
					}
					break;
				case 87: //w
					if (current == 0) {
						setCurrent(items.length - 1);
					} else {
						setCurrent(current - 1);
					}
					break;
				case 40: //Down
					if (current == items.length - 1) {
						setCurrent(0);
					} else {
						setCurrent(current + 1);
					}
					break;
				case 83: //s
					if (current == items.length - 1) {
						setCurrent(0);
					} else {
						setCurrent(current + 1);
					}
					break;
				case 13: //enter
						MenuItem(items[current]).onClick(null);
					break;
			}
		}
		
		public function hide():void {
			for each (var item:MenuItem in items) {
				item.hide();
			}
		}
		
		public function show():void {
			for each (var item:MenuItem in items) {
				item.show();
			}
		}
		
		public function remove():void {
			for each (var item:MenuItem in items) {
				item.remove();
			}
		}
	}
}