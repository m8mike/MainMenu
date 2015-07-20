package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class ButtonBack {
		private var costume:MovieClip;
		private var onClick:Function;
		
		public function ButtonBack(parent:DisplayObjectContainer, onClick:Function) {
			costume = new button_back();
			costume.x = 30;
			costume.y = 450;
			costume.scaleX = 0.2;
			costume.scaleY = 0.2;
			parent.addChild(costume);
			costume.addEventListener(MouseEvent.CLICK, onClick);
			MainMenu.getStage().addEventListener(KeyboardEvent.KEY_DOWN, handleEscape);
			this.onClick = onClick;
		}
		
		private function handleEscape(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case 8: //backspace
					onClick(null);
					break;
				case 27: //esc
					onClick(null);
					break;
			}
		}
		
		public function remove():void {
			costume.removeEventListener(MouseEvent.CLICK, onClick);
			costume.parent.removeChild(costume);
		}
	}
}