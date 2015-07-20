package {
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class LevelInfo {
		private var parent:DisplayObjectContainer;
		private var fileNameTF:TextField;
		private var levelNameTF:TextField;
		private var levelNameShadow:TextField;
		private var levelCommentTF:TextField;
		private var saveButtonTF:TextField;
		private var loadButtonTF:TextField;
		private var playButton:MovieClip;
		private var index:Point;
		
		public function LevelInfo(parent:DisplayObjectContainer) {
			this.parent = parent;
			addFileName("fileName");
			addLevelName("Just a level name");
			addLevelComment("Comment");
			addSaveButton();
			addLoadButton();
			addPlayButton();
		}
		
		public function setLevelInfo(fileName:String, name:String, comment:String, loc:Point):void {
			fileNameTF.text = fileName;
			levelNameTF.text = name;
			levelNameShadow.text = name;
			levelCommentTF.text = comment;
			index = loc.clone();
		}
		
		private function addFileName(name:String):void {
			fileNameTF = new TextField();
			fileNameTF.text = name;
			fileNameTF.x = 350;
			fileNameTF.y = 50;
			fileNameTF.visible = true;
			fileNameTF.selectable = true;
			fileNameTF.type = TextFieldType.INPUT;
			var mytf:TextFormat = new TextFormat("Arial");
			mytf.size = 18;
			mytf.align = TextFormatAlign.CENTER;
			fileNameTF.setTextFormat(mytf);
			fileNameTF.defaultTextFormat = mytf;
			fileNameTF.width = 240;
			fileNameTF.height = 40;
			fileNameTF.textColor = 0x80FFFF;
			fileNameTF.background = true;
			fileNameTF.backgroundColor = 0x000000;
			fileNameTF.alpha = 0.3;
			fileNameTF.maxChars = 30;
			fileNameTF.wordWrap = true;
			parent.addChild(fileNameTF);
			fileNameTF.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			fileNameTF.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
		}
		
		private function addLevelName(name:String):void {
			levelNameTF = new TextField();
			levelNameTF.text = name;
			levelNameTF.x = 350;
			levelNameTF.y = 100;
			levelNameTF.visible = true;
			levelNameTF.selectable = true;
			levelNameTF.type = TextFieldType.INPUT;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			mytf.align = TextFormatAlign.CENTER;
			levelNameTF.setTextFormat(mytf);
			levelNameTF.defaultTextFormat = mytf;
			levelNameTF.width = 240;
			levelNameTF.height = 100;
			//levelNameTF.alpha = 0.7;
			levelNameTF.textColor = 0xFFFFFF;
			//levelNameTF.background = true;
			//levelNameTF.backgroundColor = 0x000000;
			levelNameTF.multiline = true;
			levelNameTF.maxChars = 50;
			levelNameTF.wordWrap = true;
			levelNameTF.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			levelNameTF.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
			levelNameTF.addEventListener(Event.CHANGE, updateShadow);
			
			levelNameShadow = new TextField();
			levelNameShadow.text = name;
			levelNameShadow.x = 352;
			levelNameShadow.y = 102;
			levelNameShadow.visible = true;
			levelNameShadow.selectable = false;
			levelNameShadow.setTextFormat(mytf);
			levelNameShadow.defaultTextFormat = mytf;
			levelNameShadow.width = 240;
			levelNameShadow.height = 100;
			levelNameShadow.textColor = 0x000000;
			levelNameShadow.multiline = true;
			levelNameShadow.maxChars = 50;
			levelNameShadow.wordWrap = true;
			parent.addChild(levelNameShadow);
			parent.addChild(levelNameTF);
		}
		
		private function updateShadow(e:Event):void {
			levelNameShadow.text = levelNameTF.text;
		}
		
		private function focusIn(e:FocusEvent):void {
			CarbonMenu.levelCursor.disallowMoving();
		}
		
		private function focusOut(e:FocusEvent):void {
			CarbonMenu.levelList.getLevelAt(index).fileName = fileNameTF.text;
			CarbonMenu.levelList.getLevelAt(index).name = levelNameTF.text;
			CarbonMenu.levelList.getLevelAt(index).comment = levelCommentTF.text;
			CarbonMenu.levelCursor.allowMoving();
		}
		
		private function addLevelComment(comment:String):void {
			var rectBG:MovieClip = new MovieClip();
			rectBG.graphics.beginFill(0xFFFFFF, 0.5);
			rectBG.graphics.drawRect(350, 210, 240, 130);
			rectBG.graphics.endFill();
			parent.addChild(rectBG);
			levelCommentTF = new TextField();
			levelCommentTF.text = comment;
			levelCommentTF.x = 350;
			levelCommentTF.y = 210;
			levelCommentTF.visible = true;
			levelCommentTF.selectable = true;
			levelCommentTF.type = TextFieldType.INPUT;
			var mytf:TextFormat = new TextFormat("Arial");
			mytf.size = 18;
			mytf.align = TextFormatAlign.CENTER;
			levelCommentTF.setTextFormat(mytf);
			levelCommentTF.defaultTextFormat = mytf;
			levelCommentTF.width = 240;
			levelCommentTF.height = 160;
			levelCommentTF.textColor = 0x000000;
			levelCommentTF.multiline = true;
			levelCommentTF.maxChars = 150;
			levelCommentTF.wordWrap = true;
			parent.addChild(levelCommentTF);
			levelCommentTF.addEventListener(FocusEvent.FOCUS_IN, focusIn);
			levelCommentTF.addEventListener(FocusEvent.FOCUS_OUT, focusOut);
		}
		
		private function addSaveButton():void {
			saveButtonTF = new TextField();
			saveButtonTF.text = "Save";
			saveButtonTF.x = 360;
			saveButtonTF.y = 440;
			saveButtonTF.visible = true;
			saveButtonTF.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			mytf.align = TextFormatAlign.CENTER;
			saveButtonTF.setTextFormat(mytf);
			saveButtonTF.defaultTextFormat = mytf;
			saveButtonTF.width = 100;
			saveButtonTF.height = 30;
			saveButtonTF.textColor = 0x80FF80;
			saveButtonTF.background = true;
			saveButtonTF.backgroundColor = 0x008000;
			saveButtonTF.multiline = true;
			saveButtonTF.maxChars = 150;
			saveButtonTF.wordWrap = true;
			saveButtonTF.addEventListener(MouseEvent.CLICK, saveLevelInfo);
			parent.addChild(saveButtonTF);
		}
		
		private function addLoadButton():void {
			loadButtonTF = new TextField();
			loadButtonTF.text = "Load";
			loadButtonTF.x = 480;
			loadButtonTF.y = 440;
			loadButtonTF.visible = true;
			loadButtonTF.selectable = false;
			var mytf:TextFormat = new TextFormat("Zorque-Regular");
			mytf.size = 22;
			mytf.align = TextFormatAlign.CENTER;
			loadButtonTF.setTextFormat(mytf);
			loadButtonTF.defaultTextFormat = mytf;
			loadButtonTF.width = 100;
			loadButtonTF.height = 30;
			loadButtonTF.textColor = 0x80FF80;
			loadButtonTF.background = true;
			loadButtonTF.backgroundColor = 0x008000;
			loadButtonTF.multiline = true;
			loadButtonTF.maxChars = 150;
			loadButtonTF.wordWrap = true;
			loadButtonTF.addEventListener(MouseEvent.CLICK, loadInfo);
			parent.addChild(loadButtonTF);
		}
		
		private function addPlayButton():void {
			playButton = new button_play();
			playButton.x = 470;
			playButton.y = 390;
			playButton.scaleX = 0.3;
			playButton.scaleY = 0.3;
			parent.addChild(playButton);
		}
		
		private function loadInfo(e:MouseEvent):void {
			LevelInfoLoader.loadLevel();
		}
		
		private function saveLevelInfo(e:MouseEvent):void {
			CarbonMenu.levelList.save();
		}
	}
}