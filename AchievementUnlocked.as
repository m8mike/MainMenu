package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class AchievementUnlocked {
		private var text:TextField;
		private var part:MovieClip;
		private var costume:MovieClip;
		public var visibleTime:int = 200;
		private var parent:DisplayObjectContainer;
		
		public function AchievementUnlocked(parent:DisplayObjectContainer) {
			costume = new achievement_unlocked();
			costume.x = 320;
			costume.y = 400;
			parent.addChild(costume);
			part = new ach4();
			part.x = 320;
			part.y = 400;
			parent.addChild(part);
			text = new TextField();
			text.text = "Achievement Unlocked\nFind watermelon's hat";
			text.x = 200;
			text.y = 410;
			text.visible = true;
			text.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 16;
			mytf.align = TextFormatAlign.CENTER;
			text.setTextFormat(mytf);
			text.defaultTextFormat = mytf;
			text.width = 600;
			text.height = 100;
			text.textColor = 0xFFFFFF;
			text.multiline = true;
			text.wordWrap = true;
			parent.addChild(text);
			parent.addEventListener(Event.ENTER_FRAME, update);
			this.parent = parent;
		}
		
		
		private function update(e:Event):void {
			if (visibleTime > 0) {
				visibleTime--;
				if (visibleTime <= 100) {	
					costume.alpha -= 0.01;
					text.alpha -= 0.01;
					part.alpha -= 0.01;
				}
			} else {
				remove();
			}
		}
		
		public function remove():void {
			costume.parent.removeChild(costume);
			text.parent.removeChild(text);
			part.parent.removeChild(part);
			parent.removeEventListener(Event.ENTER_FRAME, update);
		}
	}
}