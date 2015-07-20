package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelList extends MovieClip {
		private var levels:Array = [];
		private var levelsLayer:MovieClip;
		
		public static const OFFSET_X:int = 70;
		public static const OFFSET_Y:int = 50;
		public static const OFFSET_BETWEEN_LEVELS:int = 80;
		
		public function LevelList(parent:DisplayObjectContainer) {
			parent.addChild(this);
			levelsLayer = new MovieClip();
			this.addChild(levelsLayer);
		}
		
		public function getLevelAt(loc:Point):LevelCell {
			return levels[loc.y][loc.x];
		}
		
		public function getLength():int {
			return levels.length;
		}
		
		public function addRow():void {
			var rowIndex:int = levels.length;
			levels[rowIndex] = new Array();
			addLevelsInRow(levels[rowIndex] as Array, rowIndex);
		}
		
		private function addLevelsInRow(row:Array, index:int):void {
			row[0] = addNewLevel(0, index);
			row[1] = addNewLevel(1, index);
			row[2] = addNewLevel(2, index);
		}
		
		private function addNewLevel(i:Number, j:int, stateIndex:int = 1):LevelCell {
			var state:LevelState;
			//stateIndex
			switch (Math.round(Math.random() * 3)) {
				case 0: 
					state = new LevelStateFinished();
					break;
				case 1: 
					state = new LevelStateOpen();
					break;
				case 2: 
					state = new LevelStateClosed();
					break;
				default: 
					state = new LevelStateFinished();
			}
			return new LevelCell(state, new Point(i, j), levelsLayer);
		}
		
		public function clean():void {
			while (levels.length) {
				while ((levels[0] as Array).length) {
					LevelCell((levels[0] as Array)[0]).remove();
					(levels[0] as Array).splice(0, 1);
				}
				levels.splice(0, 1);
			}
		}
		
		public function remove():void {
			clean();
			if (this.parent) {
				parent.removeChild(this);
			}
		}
		
		public function removeRow(x:Number, y:Number):void {
			LevelCell(levels[x][0]).remove();
			LevelCell(levels[x][1]).remove();
			LevelCell(levels[x][2]).remove();
			levels.splice(x, 1);
			for (var i:int = x; i < levels.length; i++) {
				LevelCell(levels[i][0]).moveUp();
				LevelCell(levels[i][1]).moveUp();
				LevelCell(levels[i][2]).moveUp();
			}
		}
		
		public function save():void {
			var str:String = "";
			for (var i:int = 0; i < levels.length; i++) {
				str += "<row>";
				str += LevelCell(levels[i][0]).getXMLStr();
				str += LevelCell(levels[i][1]).getXMLStr();
				str += LevelCell(levels[i][2]).getXMLStr();
				str += "</row>";
			}
			LevelInfoLoader.saveInfo(str);
		}
	}
}