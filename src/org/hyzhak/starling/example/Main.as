package org.hyzhak.starling.example
{
	import feathers.controls.ScreenNavigator;
	import feathers.controls.ScreenNavigatorItem;
	import feathers.motion.transitions.ScreenSlidingStackTransitionManager;
	import feathers.themes.MetalWorksMobileTheme;
	
	import org.hyzhak.starling.display.FeatherExtensionTheme;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Main extends Sprite
	{
		private static const MAIN_MENU:String = "mainMenu";
		
		private var _theme:MetalWorksMobileTheme;
		private var _extensionTheme:FeatherExtensionTheme;
		
		private var _navigator:ScreenNavigator;
		
		private var _transitionManager:ScreenSlidingStackTransitionManager;
		
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(event:Event):void
		{
			_theme = new MetalWorksMobileTheme(stage);
			_extensionTheme = new FeatherExtensionTheme(stage);
			
			_navigator = new ScreenNavigator();
			addChild(_navigator);
			
			this._navigator.addScreen(MAIN_MENU, new ScreenNavigatorItem(MainMenuScreen));
			
			this._navigator.showScreen(MAIN_MENU);
			
			this._transitionManager = new ScreenSlidingStackTransitionManager(this._navigator);
			this._transitionManager.duration = 0.4;
		}
	}
}