package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelState {
		protected var costume:MovieClip;
		public static const SIZE:int = 60;
		public static const STROKE:int = 10;
		
		
		public function LevelState() {
			
		}
		
		public function getSprite(x:int, y:int):MovieClip {
			return null;
		}
		
		public function remove():void {
			costume.parent.removeChild(costume);
		}
		
		public function moveUp():void {
			costume.y -= LevelList.OFFSET_BETWEEN_LEVELS;
		}
	}
}