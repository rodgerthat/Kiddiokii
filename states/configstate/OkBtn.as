package states.configstate {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import events.ViewChangeEvent;

	public class OkBtn extends MovieClip {
		
		private var okBtn:Ok_btn_mc;
		
		// ye olds constructor
		public function OkBtn() {
			
			okBtn = new Ok_btn_mc();
			okBtn.x = 0;
			okBtn.y = 0;
			okBtn.buttonMode = true;
			okBtn.addEventListener(MouseEvent.MOUSE_DOWN, handleOkBtnMouseDown);
			addChild(okBtn);
			
			super();
		}
		
		private function handleOkBtnMouseDown(e:MouseEvent):void {
			
			dispatchEvent(new ViewChangeEvent(ViewChangeEvent.CHANGE, "configUP"));
			
		}
		
	}
	
}