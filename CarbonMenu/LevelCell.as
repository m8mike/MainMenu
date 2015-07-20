package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelCell {
		private var _state:LevelState;
		private var _location:Point;
		
		public var fileName:String = "default";
		public var name:String = "default";
		public var comment:String = "default";
		
		public function LevelCell(state:LevelState, location:Point, parent:DisplayObjectContainer) {
			_state = state;
			_location = location;
			var icon:MovieClip = _state.getSprite(LevelList.OFFSET_X + location.x * LevelList.OFFSET_BETWEEN_LEVELS, 
												  LevelList.OFFSET_Y + location.y * LevelList.OFFSET_BETWEEN_LEVELS);
			var shadow:MovieClip = new MovieClip();
			shadow.graphics.beginFill(0x00FF80, 0.6);
			shadow.graphics.drawRoundRect(0, 0, 200, 200, 80);
			shadow.graphics.endFill();
			shadow.x = location.x-30;
			shadow.y = location.y-30;
			icon.addChildAt(shadow, 0);
			icon.addEventListener(MouseEvent.CLICK, moveCursor);
			parent.addChild(icon);
		}
		
		private function moveCursor(e:MouseEvent):void {
			CarbonMenu.levelCursor.allowMoving();
			CarbonMenu.levelCursor.moveTo(_location.x, _location.y);
		}
		
		public function getStateStr():String {
			return getQualifiedClassName(_state);
		}
		
		public function remove():void {
			if (_state) {
				_state.remove();
			}
			if (_location) {
				_location = null;
			}
		}
		
		public function moveUp():void {
			_state.moveUp();
		}
		
		public function getXMLStr():String {
			var str:String = "<level><fileName>";
			str += fileName;
			str += "</fileName>";
			str += "<levelName>";
			str += name;
			str += "</levelName>";
			str += "<comment>";
			str += comment;
			str += "</comment></level>";
			return str;
		}
	}
}