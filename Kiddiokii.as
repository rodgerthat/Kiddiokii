package {
	
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import events.ViewChangeEvent;
	
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	
	import flash.events.EventDispatcher;
	
	import flash.system.Security;
	import flash.system.SecurityPanel;
	
	import states.HomeState;
	import states.PlayState;
	import states.configstate.ConfigPanel;

	public class Kiddiokii extends MovieClip {
		
		private var background:Background_mc;
		
		private var introBG:Intro_bg_mc;
		private var securityPanelTube:Security_panel_tube_mc;
		
		private var configPanelBlackOut:Config_panel_black_out_mc;
		private var configBtn:Config_btn_mc;
		private var configPanel:ConfigPanel;
		
		private var configPanelIsUP:Boolean;
		
		private var homeState:HomeState;
		private var playState:PlayState;
		
		private var onBtn:ArcadeBtnGreen;
		
		public function Kiddiokii():void {
			
			background = new Background_mc();
			background.x = 1;
			background.y = 1;
			background.alpha = 0;
			
			playState = new PlayState();
			playState.x = 0;
			playState.y = 0;
			playState.alpha = 0;
			
			homeState = new HomeState();
			homeState.x = 0;
			homeState.y = 0;
			
			configPanelBlackOut = new Config_panel_black_out_mc();
			configPanelBlackOut.x = 0;
			configPanelBlackOut.y = 0;
			configPanelBlackOut.alpha = 0;
			configPanelBlackOut.mouseEnabled = false;
			configPanelBlackOut.mouseChildren = false;
			
			configPanel = new ConfigPanel();
			configPanel.x = 100;
			configPanel.y = -600;
			
			configPanelIsUP = true;
			
			configBtn = new Config_btn_mc();
			configBtn.x = 81;
			configBtn.y = 33;
			configBtn.rotation = 90;
			configBtn.buttonMode = true;
			configBtn.addEventListener(MouseEvent.MOUSE_OVER, handleConfigBtnMouseOver);
			configBtn.addEventListener(MouseEvent.MOUSE_OUT, handleConfigBtnMouseOut);
			configBtn.addEventListener(MouseEvent.MOUSE_DOWN, handleConfigBtnMouseDown);
			configBtn.addEventListener(MouseEvent.MOUSE_UP, handleConfigBtnMouseUp);
			configBtn.alpha = 0;
			
			introBG = new Intro_bg_mc();
			introBG.x = 32;
			introBG.y = 27;
			addChild(introBG);
			
			securityPanelTube = new Security_panel_tube_mc();
			securityPanelTube.x = 327;
			securityPanelTube.y = -14;
			addChild(securityPanelTube);
			
			onBtn = new ArcadeBtnGreen();
			onBtn.x = stage.stageWidth/2;
			onBtn.y = stage.stageHeight/2;
			onBtn.buttonMode = true;
			onBtn.addEventListener(MouseEvent.MOUSE_DOWN, handleOnBtnMouseDown);
			addChild(onBtn);
			
			// that 'true' on teh end enables the useCapture,
			stage.addEventListener(ViewChangeEvent.CHANGE, handleViewChange, true);
			
			// stage.addEventListener(ViewChangeEvent.CHANGE, handleViewChange);
			
			stage.addEventListener(KeyboardEvent.KEY_UP, handleEscKeyUp, true);
			
			Security.showSettings(SecurityPanel.PRIVACY);
			
			super();
			
		}
		
		public function handleOnBtnMouseDown(e:MouseEvent):void {
			
			addChild(background);
			
			TweenMax.to(securityPanelTube, 1.5, {y:-412});
			TweenMax.to(background, 1.5, {alpha:1});
			TweenMax.to(onBtn, 1.5, {alpha:0});
			
			addChild(playState);
			
			TweenMax.to(playState, 2, {delay:2, alpha:1});
			
			addChild(homeState);
			
			addChild(configPanelBlackOut);
			
			addChild(configPanel);
			
			addChild(configBtn);
			TweenMax.to(configBtn, 0.7, {alpha:1});
			
			removeChild(onBtn);
			removeChild(introBG);
			
			homeState.initialize();
			
		}
		
		private function handleViewChange(e:ViewChangeEvent):void {
			
			switch (e.viewChangeCase) {
			
				case "config":
						
						configPanelBlackOut.mouseEnabled = true;
						configPanelBlackOut.mouseChildren = true;
						
						TweenMax.to(configPanelBlackOut, 1, {alpha:0.7});
						TweenMax.to(configPanel, 1, {delay: 0.7, y:40, ease:Elastic.easeOut});
						
						configPanelIsUP = false;
						
						playState.songPlayer.pauseIt();

					break;
					
				case "configUP":
						
						configPanelBlackOut.mouseEnabled = false;
						configPanelBlackOut.mouseChildren = false;
						
						TweenMax.to(configPanelBlackOut, 1, {alpha:0});
						TweenMax.to(configPanel, 1, {y:-600, ease:Elastic.easeIn});
						
						configPanelIsUP = true;
						
						playState.songPlayer.resumeIt();

					break;
			
				case "title":
						
						homeState.initialize();
						playState.retract();
					
					break;
					
					
				case "play":

						homeState.retract();
						playState.initialize();
						
					break;
					
				default:
					trace("default case achieved! lol.");
					// and do nothing.
				
			}
			
		}
		
		private function handleConfigBtnMouseOver(e:MouseEvent):void {
			
			
			
		}
		
		private function handleConfigBtnMouseOut(e:MouseEvent):void {
			

			
		}
		
		private function handleConfigBtnMouseDown(e:MouseEvent):void {
		
			configBtn.gotoAndPlay(1);
			
		}
		
		private function handleConfigBtnMouseUp(e:MouseEvent):void {
			
			if (configPanelIsUP == true) {
			
				dispatchEvent(new ViewChangeEvent(ViewChangeEvent.CHANGE, "config"));
				
			} else {
				
				dispatchEvent(new ViewChangeEvent(ViewChangeEvent.CHANGE, "configUP"));
				
			}

		}
		
		

		private function handleEscKeyUp(e:KeyboardEvent):void {
			
			if (e.keyCode == 27) {
				trace("Esc key pressed");
				
			}
			
		}
		
	}
	
}