package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class ScrollBar {
		private var bar:MovieClip;
		private var point:MovieClip;
		private var x:Number;
		private var parent:DisplayObjectContainer;
		
		public function ScrollBar(parent:DisplayObjectContainer, x:Number, y:Number, text:String) {
			this.x = x;
			this.parent = parent;
			
			addText(text, x - 200, y - 20);
			
			bar = new scroll_bar();
			bar.x = x;
			bar.y = y;
			bar.scaleX = 0.2;
			bar.scaleY = 0.2;
			parent.addChild(bar);
			point = new scroll_point();
			point.x = x;
			point.y = y + 10;
			point.scaleX = 0.15;
			point.scaleY = 0.15;
			parent.addChild(point);
			point.addEventListener(MouseEvent.MOUSE_DOWN, down);
			point.addEventListener(MouseEvent.MOUSE_UP, up);
			point.addEventListener(MouseEvent.MOUSE_OUT, up);
			bar.addEventListener(MouseEvent.CLICK, scroll);
			bar.addEventListener(MouseEvent.MOUSE_DOWN, down);
			bar.addEventListener(MouseEvent.MOUSE_UP, up);
		}
		
		private function up(e:MouseEvent):void {
			point.parent.removeEventListener(MouseEvent.MOUSE_MOVE, scroll);
		}
		
		private function down(e:MouseEvent):void {
			point.parent.addEventListener(MouseEvent.MOUSE_MOVE, scroll);
		}
		
		private function scroll(e:MouseEvent):void {
			if (e.stageX > x && e.stageX < x + 310) {	
				point.x = e.stageX;
			}
		}
		
		private function addText(text:String, x:Number, y:Number):void {
			var itemText:TextField = new TextField();
			itemText.text = text;
			itemText.x = x;
			itemText.y = y;
			itemText.visible = true;
			itemText.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 40;
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
			parent.addChild(itemShadow);
			parent.addChild(itemText);
		}
		
		public function show():void {
			point.addEventListener(MouseEvent.MOUSE_DOWN, down);
			point.addEventListener(MouseEvent.MOUSE_UP, up);
			point.addEventListener(MouseEvent.MOUSE_OUT, up);
			bar.addEventListener(MouseEvent.CLICK, scroll);
			bar.addEventListener(MouseEvent.MOUSE_DOWN, down);
			bar.addEventListener(MouseEvent.MOUSE_UP, up);
		}
		
		public function hide():void {
			if (point.parent.hasEventListener(MouseEvent.MOUSE_MOVE)) {
				point.parent.removeEventListener(MouseEvent.MOUSE_MOVE, scroll);
			}
			point.removeEventListener(MouseEvent.MOUSE_DOWN, down);
			point.removeEventListener(MouseEvent.MOUSE_UP, up);
			point.removeEventListener(MouseEvent.MOUSE_OUT, up);
			bar.removeEventListener(MouseEvent.CLICK, scroll);
			bar.removeEventListener(MouseEvent.MOUSE_DOWN, down);
			bar.removeEventListener(MouseEvent.MOUSE_UP, up);
		}
	}
}