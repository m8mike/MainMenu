package {
	import flash.display.DisplayObjectContainer;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class Settings {
		private var fullScreen:CheckBox;
		private var music:ScrollBar;
		private var sound:ScrollBar;
		private var parent:DisplayObjectContainer;
		
		public function Settings(parent:DisplayObjectContainer) {
			this.parent = parent;
			fullScreen = new CheckBox(parent, 280, 100, "Full Screen");
			music = new ScrollBar(parent, 280, 200, "Music");
			sound = new ScrollBar(parent, 280, 300, "Sound");
		}
		
		public function hide():void {
			fullScreen.hide();
			music.hide();
			sound.hide();
			parent.visible = false;
		}
		
		public function show():void {
			fullScreen.show();
			music.show();
			sound.show();
			parent.visible = true;
		}
	}
}