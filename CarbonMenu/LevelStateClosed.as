package {
	import flash.display.MovieClip;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelStateClosed extends LevelState {
		
		public function LevelStateClosed() {
		
		}
		
		override public function getSprite(x:int, y:int):MovieClip {
			costume = new level_closed();
			costume.x = x;
			costume.y = y;
			costume.width = 60;
			costume.height = 60;
			return costume;
		}
	}
}