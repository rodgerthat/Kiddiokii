package events {
	
	import flash.events.Event;

	public class CamEvent extends Event {
		
		public static const CHANGE:String = "change";
		public var camActivityLevel:Number;
		
		public function CamEvent(type:String, camActivityLevel:Number) {
			
			this.camActivityLevel = camActivityLevel;
			
			super(type);
		}
		
	}
	
}