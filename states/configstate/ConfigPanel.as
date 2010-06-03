package states.configstate {
	
	import events.ViewChangeEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	public class ConfigPanel extends MovieClip {
		
		private var configBG:Config_bg_mc;
		
		private var volumeBar:VolumeBar;
		
		private var timeoutScrubBar:ScrubBar;
		
		private var timeoutTimeInputField:TimeoutTimerInput;
		
		private var okBtn:OkBtn;
		
		// ye olde constructor
		public function ConfigPanel() {
			
			configBG = new Config_bg_mc();
			configBG.x = 0;
			configBG.y = 0;
			addChild(configBG);
			
			volumeBar = new VolumeBar();
			volumeBar.x = 280;
			volumeBar.y = 155;
			addChild(volumeBar);
			
			timeoutScrubBar = new ScrubBar();
			timeoutScrubBar.x = 280;
			timeoutScrubBar.y = 250;
			addChild(timeoutScrubBar);
			
			timeoutTimeInputField = new TimeoutTimerInput();
			timeoutTimeInputField.x = 260;
			timeoutTimeInputField.y = 370;
			addChild(timeoutTimeInputField);
			
			okBtn = new OkBtn();
			okBtn.x = 530;
			okBtn.y = 375;
			addChild(okBtn);
			
			// addEventListener(Event.ENTER_FRAME,handleEnterFrame);
			
			super();
		}
		
	}
	
}