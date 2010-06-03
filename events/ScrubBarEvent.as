package events {
	
	// ah a custom event. goodTimes.
	import flash.events.Event;

	public class ScrubBarEvent extends Event {
		
		public static const CHANGE:String = "change";
		
		public var newValue:Number;
		
		public function ScrubBarEvent(type:String,newValue:Number) {
			
			this.newValue = newValue;
			
			super(type);
			
		}
		
	}
	
}