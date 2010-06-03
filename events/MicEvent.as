package events {
	
	import flash.events.Event;

	public class MicEvent extends Event {
		
		public static const CHANGE:String = "change";
		public var micActivityLevel:Number;
		
		public function MicEvent(type:String, micActivityLevel:Number) {
			
			this.micActivityLevel = micActivityLevel;
			
			super(type);
		}
		
	}
	
}