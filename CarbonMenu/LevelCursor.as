package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelCursor extends MovieClip {
		private var sprite:MovieClip;
		public var location:Point;
		private var levelList:LevelList;
		private var movingAllowed:Boolean = true;
		
		public function LevelCursor(levelList:LevelList) {
			location = new Point();
			sprite = new MovieClip();
			this.levelList = levelList;
			moveTo(0, 0);
			sprite.graphics.beginFill(0x00FF00, 0);
			sprite.graphics.lineStyle(LevelState.STROKE, 0xFFFF00);
			sprite.graphics.drawRoundRect(0, 0, LevelState.SIZE, LevelState.SIZE, 0.4 * LevelState.SIZE);
			sprite.graphics.endFill();
			levelList.addChild(sprite);
		}
		
		public function allowMoving():void {
			movingAllowed = true;
		}
		
		public function disallowMoving():void {
			movingAllowed = false;
		}
		
		public function update():void {
			if (sprite.y + LevelList.OFFSET_Y + levelList.y > 400) {
				CarbonMenu.slide(levelList.y + sprite.y - LevelList.OFFSET_Y - 240);
			} else if (sprite.y + LevelList.OFFSET_Y + levelList.y < 30) {
				CarbonMenu.slide(levelList.y + sprite.y - LevelList.OFFSET_Y);
			}
		}
		
		public function moveTo(x:int, y:int):void {
			if (!movingAllowed) {
				return void;
			}
			location.x = x;
			location.y = y;
			sprite.x = LevelList.OFFSET_X + x * LevelList.OFFSET_BETWEEN_LEVELS;
			sprite.y = LevelList.OFFSET_Y + y * LevelList.OFFSET_BETWEEN_LEVELS;
			setLevelInfo();
			if (sprite.y + LevelList.OFFSET_Y + levelList.y > 400) {
				CarbonMenu.slide(levelList.y + sprite.y - LevelList.OFFSET_Y - 240);
			} else if (sprite.y + LevelList.OFFSET_Y + levelList.y < 30) {
				CarbonMenu.slide(levelList.y + sprite.y - LevelList.OFFSET_Y);
			}
		}
		
		public function setLevelInfo():void {
			var level:LevelCell = levelList.getLevelAt(location);
			CarbonMenu.levelInfo.setLevelInfo(level.fileName, level.name, level.comment, location);
		}
		
		public function moveRight():void {
			if (location.x < 2) {
				location.x++;
			} else {
				location.x = 0;
			}
			moveTo(location.x, location.y);
		}
		
		public function moveLeft():void {
			if (location.x > 0) {
				location.x--;
			} else {
				location.x = 2;
			}
			moveTo(location.x, location.y);
		}
		
		public function moveUp():void {
			if (location.y > 0) {
				location.y--;
			} else {
				location.y = levelList.getLength() - 1;
			}
			moveTo(location.x, location.y);
		}
		
		public function moveDown():void {
			if (location.y < levelList.getLength() - 1) {
				location.y++;
			} else {
				location.y = 0;
			}
			moveTo(location.x, location.y);
		}
		
		public function remove():void {
			sprite.parent.removeChild(sprite);
		}
		
		public function removeCurrentRow():void {
			if (!movingAllowed) {
				return void;
			}
			if (levelList.getLength() > 1) {	
				levelList.removeRow(location.y, location.x);
				if (location.y >= levelList.getLength()) {
					moveUp();
				} else {
					setLevelInfo();
				}
			}
		}
	}
}