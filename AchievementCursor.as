package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class AchievementCursor {
		private const MAX_X = 10;
		private const MAX_Y = 10;
		private var x:int = 0;
		private var y:int = 0;
		
		private var costume:MovieClip;
		public var movingAllowed:Boolean = true;
		
		public function AchievementCursor(parent:DisplayObjectContainer) {
			costume = new achievement_cursor();
			parent.addChild(costume);
			moveTo(0, 0);
		}
		
		public function moveTo(x:int, y:int):void {
			if (!movingAllowed) {
				return void;
			}
			this.x = x;
			this.y = y;
			costume.x = 73 + (x - (x % 2)) * AchievementsSection.OFFSET_X;
			costume.y = 77 + (y - (y % 2)) * AchievementsSection.OFFSET_Y;
			if (x % 2) {
				if (y % 2) {
					costume.rotation = 180;
				} else {
					costume.rotation = 90;
				}
			} else {
				if (y % 2) {
					costume.rotation = -90;
				} else {
					costume.rotation = 0;
				}
			}
			//setLevelInfo();
			/*if (sprite.y + AchievementsSection.OFFSET_Y + levelList.y > 400) {
				CarbonMenu.slide(levelList.y + sprite.y - AchievementsSection.OFFSET_Y - 240);
			} else if (sprite.y + AchievementsSection.OFFSET_Y + levelList.y < 30) {
				CarbonMenu.slide(levelList.y + sprite.y - AchievementsSection.OFFSET_Y);
			}*/
		}
		
		public function moveRight():void {
			if (x < MAX_X-1) {
				x++;
			} else {
				x = 0;
			}
			moveTo(x, y);
		}
		
		public function moveLeft():void {
			if (x > 0) {
				x--;
			} else {
				x = MAX_X-1;
			}
			moveTo(x, y);
		}
		
		public function moveUp():void {
			if (y > 0) {
				y--;
			} else {
				y = MAX_Y-1;
			}
			moveTo(x, y);
		}
		
		public function moveDown():void {
			if (y < MAX_Y-1) {
				y++;
			} else {
				y = 0;
			}
			moveTo(x, y);
		}
	}
}