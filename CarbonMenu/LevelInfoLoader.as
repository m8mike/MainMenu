package {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.net.FileReference;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelInfoLoader {
		public static var xmlToLoad:XML;
		private static var ldr:URLLoader;
		private static var loading:Boolean;
		
		public function LevelInfoLoader() {
		
		}
		
		public static function saveInfo(levels:String):void {
			var str:String = "<levelsInfo><levels>";
			str += levels;
			str += "</levels></levelsInfo>";
			var xml:XML = new XML(str);
			var file:FileReference = new FileReference();
			file.save(xml.toXMLString(), "levelsInfo.xml");
		}
		
		public static function loadLevel() {
			ldr = new URLLoader();
			ldr.addEventListener(Event.COMPLETE, loadComplete);
			ldr.addEventListener(IOErrorEvent.IO_ERROR, loadError);
			var path:String = "file://localhost/D:/levels/levelsInfo.xml";
			ldr.load(new URLRequest(path));
		}
		
		private static function loadXml():void {
			if (!loading) {	
				loading = true;
				loadInfo(xmlToLoad.levels);
				loading = false;
				xmlToLoad = null;
			}
		}
		
		private static function loadInfo(levels:XMLList):void {
			CarbonMenu.levelList.clean();
			var i:int = 0;
			for each (var row:XML in levels.*) {
				CarbonMenu.levelList.addRow();
				var j:int = 0;
				for each (var level:XML in row.*) {
					var fileName:String = level.fileName.text();
					var levelName:String = level.levelName.text();
					var comment:String = level.comment.text();
					var levelCell:LevelCell = CarbonMenu.levelList.getLevelAt(new Point(j, i));
					levelCell.fileName = fileName;
					levelCell.name = levelName;
					levelCell.comment = comment;
					j++;
				}
				i++;
			}
			CarbonMenu.levelCursor.moveTo(0, 0);
		}
		
		private static function loadComplete(e:Event):void {
			xmlToLoad = new XML(ldr.data);
			loadXml();
			ldr.removeEventListener(Event.COMPLETE, loadComplete);
			ldr.removeEventListener(IOErrorEvent.IO_ERROR, loadError);
		}
		
		private static function loadError(e:IOErrorEvent):void {
			trace(e.errorID);
		}
	}
}