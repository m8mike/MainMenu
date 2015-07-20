package {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	/**
	* ...
	* @author Mad Mike
	*/
	public class MainMenu extends MovieClip {
		private var menu:MenuList;
		private var hats:HatsFalling;
		private var achievementSection:AchievementsSection;
		
		public var completedLayer:MovieClip;
		public var menuLayer:MovieClip;
		public var hatzLayer:MovieClip;
		public var settingsLayer:MovieClip;
		public var achievementsLayer:MovieClip;
		public var creditsLayer:MovieClip;
		
		public var clouds:CloudsBG;
		public var carbonLayer:MovieClip;
		
		public var carbonMenu:CarbonMenu;
		public var settings:Settings;
		
		public static var thisIs:MainMenu;
		
		public function MainMenu() {
			thisIs = this;
			carbonLayer = new MovieClip();
			completedLayer = new MovieClip();
			settingsLayer = new MovieClip();
			achievementsLayer = new MovieClip();
			creditsLayer = new MovieClip();
			
			clouds = new CloudsBG();
			clouds.add();
			clouds.setIn();
			
			hatzLayer = new MovieClip();
			hatzLayer.rotation = 180;
			hatzLayer.x = 640;
			hatzLayer.y = 480;
			hatzLayer.visible = false;
			hats = new HatsFalling(hatzLayer);
			
			menuLayer = new MovieClip();
			menu = new MenuList(menuLayer, toLevelSelect, toSettings, achieve, complete);
			
			addChild(carbonLayer);
			addChild(clouds);
			addChild(creditsLayer);
			addChild(achievementsLayer);
			addChild(settingsLayer);
			addChild(hatzLayer);
			addChild(menuLayer);
			addChild(completedLayer);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, menu.controlMenu);
			addEventListener(MouseEvent.MOUSE_UP, menu.unpress);
		}
		
		public function achieve(e:MouseEvent):void {
			achievementsLayer.visible = true;
			hats.stop();
			menu.hide();
			if (!achievementSection) {
				achievementSection = new AchievementsSection(achievementsLayer);
				stage.addEventListener(KeyboardEvent.KEY_DOWN, achievementSection.control);
			} else {
				achievementsLayer.visible = true;
				stage.addEventListener(KeyboardEvent.KEY_DOWN, achievementSection.control);
			}
			new ButtonBack(achievementsLayer, fromAchievementsToMain);
		}
		
		public function complete(e:MouseEvent):void {
			completedLayer.visible = true;
			hats.stop();
			menu.hide();
			new CompletedScreen(completedLayer);
			//new ButtonBack(completedLayer, toMainMenu);
		}
		
		public function toSettings(e:MouseEvent):void {
			hats.stop();
			menu.hide();
			new AchievementUnlocked(this);
			if (settings) {
				settings.show();
			} else {	
				settings = new Settings(settingsLayer);
			}
			new ButtonBack(settingsLayer, fromSettingsToMain);
		}
		
		public function toLevelSelect(e:MouseEvent):void {
			clouds.disappear();
			hats.stop();
			menu.hide();
			if (carbonMenu) {
				carbonMenu.show();
			} else {
				carbonMenu = new CarbonMenu(carbonLayer);
			}
			new ButtonBack(carbonLayer, toMainMenu);
		}
		
		public function fromSettingsToMain(e:MouseEvent):void {
			settings.hide();
			hats.drop();
			menu.show();
		}
		
		public function fromAchievementsToMain(e:MouseEvent):void {
			achievementsLayer.visible = false;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, achievementSection.control);
			hats.drop();
			menu.show();
		}
		
		public function toMainMenu(e:MouseEvent):void {
			hats.drop();
			menu.show();
			if (carbonMenu) {
				clouds.appear(carbonMenu.hide);
				//carbonMenu.hide();
			} else {
				clouds.appear();
			}
			if (settings) {
				settings.hide();
			}
			/*
			completedLayer.visible = false;
			carbonLayer.visible = false;
			settingsLayer.visible = false;
			achievementsLayer.visible = false;
			creditsLayer.visible = false;*/
		}
		
		public function remove(e:MouseEvent):void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, menu.controlMenu);
			removeEventListener(MouseEvent.MOUSE_UP, menu.unpress);
			menu.remove();
			while (hatzLayer.numChildren) {
				hatzLayer.removeChildAt(0);
			}
			while (menuLayer.numChildren) {
				menuLayer.removeChildAt(0);
			}
			if (hatzLayer.parent) {	
				hatzLayer.parent.removeChild(hatzLayer);
			}
			if (menuLayer.parent) {	
				menuLayer.parent.removeChild(menuLayer);
			}
			clouds.remove();
		}
		
		public static function getStage():Stage {
			return thisIs.stage;
		}
	}
}