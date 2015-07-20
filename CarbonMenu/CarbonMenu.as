package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CarbonMenu extends MovieClip {
		public static var levelList:LevelList;
		public static var levelCursor:LevelCursor;
		public static var levelInfo:LevelInfo;
		public static var carbonMenu:CarbonMenu;
		private var watermelons:WatermelonsBG;
		
		private static var globalOffset:int = 0;
		public var left:Boolean = false;
		public var right:Boolean = false;
		public var up:Boolean = false;
		public var down:Boolean = false;
		
		public function CarbonMenu(parent:DisplayObjectContainer) {
			parent.addChild(this);
			watermelons = new WatermelonsBG(this);
			carbonMenu = this;
			levelList = new LevelList(this);
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			levelList.addRow();
			
			levelInfo = new LevelInfo(this);
			levelCursor = new LevelCursor(levelList);
			parent.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			parent.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(Event.ENTER_FRAME, update)
		}
		
		private function update(e:Event):void {
			if (globalOffset > 0) {
				levelList.y += 0.1 * globalOffset;
				globalOffset -= 0.1 * globalOffset;
			} else if (globalOffset < 0) {
				levelList.y += 0.1 * globalOffset;
				globalOffset -= 0.1 * globalOffset;
			} else if (globalOffset == 0) {
				levelCursor.update();
			}
			if (levelList.y > 0) {
				levelList.y = 0;
			}
			/* else if (levelList.y < -560) {
			   levelList.y = -560;
			}*/
			watermelons.update(levelList.y);
		}
		
		public static function slide(offset:Number):void {
			globalOffset -= offset;
		}
		
		public static function playLevel():void {
			trace("play " + levelList.getLevelAt(levelCursor.location).fileName);
		}
		
		private function keyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 8: //backspace
					visible = false;
					break;
				case 27: //esc
					visible = false;
					break;
				case 37: //left
					levelCursor.moveLeft();
					left = true;
					break;
				case 38: //up
					levelCursor.moveUp();
					up = true;
					break;
				case 39: //right
					levelCursor.moveRight();
					right = true;
					break;
				case 40: //down
					levelCursor.moveDown();
					down = true;
					break;
				case 189: //-
					levelCursor.removeCurrentRow();
					break;
				case 187: //+=
					levelList.addRow();
					break;
				case 109: //num-
					levelCursor.removeCurrentRow();
					break;
				case 107: //num+
					levelList.addRow();
					break;
				case 13: //enter
					playLevel();
					break;
				default: 
			}
		}
		
		private function keyUp(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 37: //left
					left = false;
					break;
				case 38: //up
					up = false;
					break;
				case 39: //right
					right = false;
					break;
				case 40: //down
					down = false;
					break;
				default: 
			}
		}
		
		public function show():void {
			if (!visible) {	
				visible = true;
				parent.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				parent.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
				addEventListener(Event.ENTER_FRAME, update)
			}
		}
		
		public function hide():void {
			if (visible) {
				visible = false;
				parent.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
				parent.stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
				removeEventListener(Event.ENTER_FRAME, update)
			}
		}
	}
}