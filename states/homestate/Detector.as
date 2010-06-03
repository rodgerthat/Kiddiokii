package states.homestate {
	
	import events.ViewChangeEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Detector extends MovieClip {
		
		private var youIcon:You_icon;
		private var webcamIcon:Webcam_icon;
		private var micIcon:Mic_icon;
		private var wiimoteIcon:Wiimote_icon;
		private var balanceboardIcon:Balanceboard_icon;
		private var goBtn:Go_btn;
		
		public function Detector() {
			
			youIcon = new You_icon();
			youIcon.x = 110;
			youIcon.y = 0;
			addChild(youIcon);
			
			webcamIcon = new Webcam_icon();
			webcamIcon.x = 0;
			webcamIcon.y = 80;
			addChild(webcamIcon);
			
			micIcon = new Mic_icon();
			micIcon.x = 220;
			micIcon.y = 80;
			addChild(micIcon);
			
			/* version 2.0...
			wiimoteIcon = new Wiimote_icon();
			wiimoteIcon.x = 40;
			wiimoteIcon.y = 210;
			addChild(wiimoteIcon);
			
			balanceboardIcon = new Balanceboard_icon();
			balanceboardIcon.x = 190;
			balanceboardIcon.y = 210;
			addChild(balanceboardIcon);
			*/
			
			goBtn = new Go_btn;
			goBtn.x = 110;
			goBtn.y = 118;
			goBtn.buttonMode = true;
			addChild(goBtn);
			
			goBtn.addEventListener(MouseEvent.MOUSE_DOWN, handleGoBtnMouseDown);
			
			super();
			
		}
		
		private function handleGoBtnMouseDown(e:MouseEvent):void {
			
			dispatchEvent(new ViewChangeEvent(ViewChangeEvent.CHANGE, "play"));
			
		}

	}
	
}