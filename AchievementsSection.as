package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class AchievementsSection {
		public static const OFFSET_X:int = 40;
		public static const OFFSET_Y:int = 40;
		public static const OFFSET_BETWEEN_ACHIEVEMENTS:int = 80;
		public static var cursor:AchievementCursor;
		
		public function AchievementsSection(parent:DisplayObjectContainer) {
			for (var i:int = 0; i < 5; i++) {
				for (var j:int = 0; j < 5; j++) {
					var achievementLocked:MovieClip = new achievement_to_unlock();
					achievementLocked.x = OFFSET_X + OFFSET_BETWEEN_ACHIEVEMENTS * j;
					achievementLocked.y = OFFSET_Y + OFFSET_BETWEEN_ACHIEVEMENTS * i;
					parent.addChild(achievementLocked);
					var a1:MovieClip;
					switch (int(Math.random() * 4)) {
						case 0: 
							a1 = new ach1();
							break;
						case 1: 
							a1 = new ach2();
							break;
						case 2: 
							a1 = new ach3();
							break;
						case 3: 
							a1 = new ach4();
							break;
						default: 
							a1 = new ach1();
					}
					a1.x = OFFSET_X + OFFSET_BETWEEN_ACHIEVEMENTS * j;
					a1.y = OFFSET_Y + OFFSET_BETWEEN_ACHIEVEMENTS * i;
					parent.addChild(a1);
					var a2:MovieClip;
					switch (int(Math.random() * 4)) {
						case 0: 
							a2 = new ach1();
							break;
						case 1: 
							a2 = new ach2();
							break;
						case 2: 
							a2 = new ach3();
							break;
						case 3: 
							a2 = new ach4();
							break;
						default: 
							a2 = new ach1();
					}
					a2.x = OFFSET_X + OFFSET_BETWEEN_ACHIEVEMENTS * j;
					a2.y = OFFSET_Y + OFFSET_BETWEEN_ACHIEVEMENTS * i;
					parent.addChild(a2);
				}
			}
			cursor = new AchievementCursor(parent);
		}
		
		public function control(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 38: //Up
					cursor.moveUp();
					break;
				case 87: //w
					cursor.moveUp();
					break;
				case 40: //Down
					cursor.moveDown();
					break;
				case 83: //s
					cursor.moveDown();
					break;
				case 37: //Left
					cursor.moveLeft();
					break;
				case 65: //a
					cursor.moveLeft();
					break;
				case 39: //Right
					cursor.moveRight();
					break;
				case 68: //d
					cursor.moveRight();
					break;
			}
		}
	}
}