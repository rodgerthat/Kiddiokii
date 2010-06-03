package events {
	
	import flash.events.Event;
	
	public class ViewChangeEvent extends Event {
		
		public static const CHANGE:String = "change";
		
		public var viewChangeCase:String;
		
		public function ViewChangeEvent(type:String, viewChangeCase:String) {
			
			this.viewChangeCase = viewChangeCase;
			
			super(type);
			
		}

	}
	
}