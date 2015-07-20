package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateFinished extends LevelState {
		
		public function LevelStateFinished() {
		
		}
		
		override public function getSprite(x:int, y:int):MovieClip {
			costume = new level_completed();
			costume.x = x;
			costume.y = y;
			costume.width = 60;
			costume.height = 60;
			return costume;
		}
	}
}