package states.playstate {
	
	import flash.display.MovieClip;

	public class SongIndicator extends MovieClip {
		
		private var indicatorWheelBG:Indicator_wheel_bg_mc;
		private var twinkleIcon:Twinkle_icon_mc;
		private var abcIcon:ABC_icon_mc;
		
		public function SongIndicator() {
			
			indicatorWheelBG = new Indicator_wheel_bg_mc();
			indicatorWheelBG.x = 0;
			indicatorWheelBG.y = 0;
			addChild(indicatorWheelBG);
			
			twinkleIcon = new Twinkle_icon_mc();
			twinkleIcon.x = 164;
			twinkleIcon.y = 41;
			// twinkleIcon.buttonMode = true;
			// twinlkeIcon.addEventListener(MouseEvent.MOUSE_UP, handleTwinkleIconMouseUp);
			addChild(twinkleIcon);
			
			abcIcon = new ABC_icon_mc();
			abcIcon.x = 142;
			abcIcon.y = 262;
			// abcIcon.buttonMode = true;
			// abcIcon.addEventListener(MouseEvent.MOUSE_UP, handleABCIconMouseUp);
			addChild(abcIcon);
			
			super();
		}

		
	}
	
}