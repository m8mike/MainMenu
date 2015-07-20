package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.StageDisplayState;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class CheckBox {
		private var parent:DisplayObjectContainer;
		private var _checked:Boolean;
		public var checkedMC:MovieClip;
		public var uncheckedMC:MovieClip;
		
		public function CheckBox(parent:DisplayObjectContainer, x:Number, y:Number, text:String) {
			this.parent = parent;
			addText(text, x - 200, y);
			addCostume(x + 100, y);
		}
		
		private function addCostume(x:Number, y:Number):void {
			checkedMC = new level_completed();
			checkedMC.x = x;
			checkedMC.y = y;
			checkedMC.scaleX = 0.4;
			checkedMC.scaleY = 0.4;
			checkedMC.visible = false;
			parent.addChild(checkedMC);
			uncheckedMC = new level_not_completed();
			uncheckedMC.x = x;
			uncheckedMC.y = y;
			uncheckedMC.scaleX = 0.4;
			uncheckedMC.scaleY = 0.4;
			parent.addChild(uncheckedMC);
			checkedMC.visible = false;
			uncheckedMC.visible = true;
			checkedMC.addEventListener(MouseEvent.CLICK, change);
			uncheckedMC.addEventListener(MouseEvent.CLICK, change);
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
		
		public function change(e:MouseEvent):void {
			changeTo(!checkedMC.visible);
		}
		
		public function changeTo(enabled):void {
			checkedMC.visible = enabled;
			uncheckedMC.visible = !enabled;
			if (enabled) {
				parent.stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			} else {
				parent.stage.displayState = StageDisplayState.NORMAL;
			}
		}
		
		public function get checked():Boolean {
			return _checked;
		}
		
		public function show():void {
			if (parent.stage.displayState == StageDisplayState.NORMAL) {
				uncheckedMC.visible = true;
			} else {
				checkedMC.visible = true;
			}
			checkedMC.addEventListener(MouseEvent.CLICK, change);
			uncheckedMC.addEventListener(MouseEvent.CLICK, change);
		}
		
		public function hide():void {
			checkedMC.visible = false;
			uncheckedMC.visible = false;
			checkedMC.removeEventListener(MouseEvent.CLICK, change);
			uncheckedMC.removeEventListener(MouseEvent.CLICK, change);
		}
	}
}