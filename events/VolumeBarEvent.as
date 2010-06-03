package events {
	
	// ah, a custom event. goodTimes.
	import flash.events.Event;
	
	public class VolumeBarEvent extends Event {
		
		public static const VOL_CHANGE:String = "change";
		
		public var volValue:Number;
		
		public function VolumeBarEvent(type:String, volValue:Number) {
			
			this.volValue = volValue;
			
			super(type);
			
		}
		
	}
	
}