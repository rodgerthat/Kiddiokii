package states.configstate {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;

	public class TimeoutTimerInput extends MovieClip {
		
		private var inputFieldBG:Time_out_trigger_entry_field_border_mc;
		private var inputField:TextField;
		
		
		public function TimeoutTimerInput() {
			
			inputFieldBG = new Time_out_trigger_entry_field_border_mc();
			inputFieldBG.x = 0;
			inputFieldBG.y = 0;
			addChild(inputFieldBG);
			
			inputField = new TextField();
			inputField.width = 85;
			inputField.height = 44;
			inputField.x = 5;
			inputField.y = 5;
			inputField.type = TextFieldType.INPUT;
			inputField.multiline = false;
			inputField.restrict = "0-9";
			inputField.maxChars = 2;
			
			inputField.alwaysShowSelection = true;
			inputField.text = "5";
			inputField.addEventListener(KeyboardEvent.KEY_DOWN, handleInputFieldKeyDown);
			
			super();
			
		}
		
		private function handleInputFieldKeyDown(e:KeyboardEvent):void {
			
			if (e.keyCode == 13) {
				trace("Enter key pressed");
			}
			
		}
		
	}
	
}