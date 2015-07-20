package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CompletedScreen extends MovieClip {
		private var next:MovieClip;
		private var reload:MovieClip;
		private var levelSelect:MovieClip;
		private var bigWM:MovieClip;
		public static var letItOut:Boolean = false;
		
		public function CompletedScreen(parent:DisplayObjectContainer) {
			bigWM = new loadingBackground();
			parent.addChild(this);
			addChild(bigWM);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function addScreen():void {
			addText("Level 1-1: Intro completed");
			addText("");
			addText("Popped 3/700 bubbles");
			addText("Collected 0/10 diamonds");
			addText("Found 0/3 secrets");
			addButtons();
		}
		
		private function update(e:Event):void {
			if (bigWM) {
				if (bigWM.currentFrame == 51) {
					bigWM.gotoAndStop(52);
					addScreen();
				} else if (bigWM.currentFrame == 52) {
					if (letItOut) {
						bigWM.gotoAndPlay(53);
					}
				} else if (bigWM.currentFrame >= 70) {
					letItOut = false;
					bigWM.stop();
					bigWM.visible = false;
					remove();
				}
			}
		}
		
		private function remove():void {
			removeEventListener(Event.ENTER_FRAME, update);
			parent.removeChild(this);
		}
		
		private function addButtons():void {
			next = new button_next();
			next.x = 500;
			next.y = 400;
			next.scaleX = 0.5;
			next.scaleY = next.scaleX;
			
			reload = new button_restart();
			reload.x = 330;
			reload.y = 400;
			reload.scaleX = next.scaleX;
			reload.scaleY = next.scaleX;
			
			levelSelect = new button_levels();
			levelSelect.x = 160;
			levelSelect.y = 400;
			levelSelect.scaleX = next.scaleX;
			levelSelect.scaleY = next.scaleX;
			
			addChild(next);
			addChild(reload);
			addChild(levelSelect);
			
			next.addEventListener(MouseEvent.CLICK, clean);
			reload.addEventListener(MouseEvent.CLICK, clean);
			levelSelect.addEventListener(MouseEvent.CLICK, clean);
		}
		
		public function clean(e:MouseEvent):void {
			for (var i:int = 0; i < numChildren; i++) {
				getChildAt(i).visible = false;
			}
			bigWM.visible = true;
			letItOut = true;
		}
		
		public function addText(text:String):void {
			var itemText:TextField = new TextField();
			itemText.text = text;
			itemText.x = 20;
			itemText.y = 20 + 30 * this.numChildren;
			itemText.visible = true;
			itemText.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 40;
			mytf.align = TextFormatAlign.CENTER;
			itemText.setTextFormat(mytf);
			itemText.defaultTextFormat = mytf;
			itemText.width = 600;
			itemText.height = 100;
			itemText.textColor = 0xFFFFFF;
			itemText.multiline = true;
			itemText.wordWrap = true;
			var itemShadow:TextField = new TextField();
			itemShadow.text = text;
			itemShadow.x = itemText.x + 5;
			itemShadow.y = itemText.y + 5;
			itemShadow.visible = true;
			itemShadow.selectable = false;
			itemShadow.setTextFormat(mytf);
			itemShadow.defaultTextFormat = mytf;
			itemShadow.width = 600;
			itemShadow.height = 100;
			itemShadow.textColor = 0x000000;
			itemShadow.multiline = true;
			itemShadow.wordWrap = true;
			addChild(itemShadow);
			addChild(itemText);
		}
	}
}