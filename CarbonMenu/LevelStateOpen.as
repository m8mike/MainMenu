package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateOpen extends LevelState {
		
		public function LevelStateOpen() {
		
		}
		
		override public function getSprite(x:int, y:int):MovieClip {
			costume = new level_not_completed();
			costume.x = x;
			costume.y = y;
			costume.width = 60;
			costume.height = 60;
			return costume;
		}
	}
}