package states.playstate {
	
	import flash.display.MovieClip;

	public class HomeBtn extends MovieClip {
		
		private var kBtnBG:Indicator_wheel_bg_mc;
		private var kBtn:K_mc;
		
		public function HomeBtn() {
			
			kBtnBG = new Indicator_wheel_bg_mc();
			kBtnBG.x = 0;
			kBtnBG.y = 0;
			addChild(kBtnBG);
			
			kBtn = new K_mc();
			kBtn.x = 60;
			kBtn.y = 162;
			addChild(kBtn);
			
			super();
		}
		
	}
	
}