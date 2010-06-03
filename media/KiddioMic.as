package media {
	
	import events.MicEvent;
	
	import flash.events.ActivityEvent;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.media.Microphone;
	
	public class KiddioMic {
		
		private static var mic:Microphone;
		
		public function KiddioMic() {
			
		}
			
		public static function getMicrophone():Microphone {
			
			/*
			// default Kiddiokii settings used before i found NeaveMic...
			myMic = Microphone.getMicrophone();
			myMic.gain = 50;
			myMic.rate = 44.1;
			myMic.setUseEchoSuppression(true);
			myMic.setLoopBack(true);
			myMic.setSilenceLevel(2, 1000);
			*/
			
			mic = Microphone.getMicrophone();

			mic.gain = 25;
			mic.rate = 44.1;
			mic.setUseEchoSuppression(true);
			mic.setLoopBack(true);
			mic.setSilenceLevel(2, 1000);
			
			mic.addEventListener(StatusEvent.STATUS, handleMicStatus);
			mic.addEventListener(ActivityEvent.ACTIVITY, handleMicActivity);
			
			return mic;
			
		}
			
		private static function handleMicStatus(e:StatusEvent):void {
			
			// trace("handling mic Status:" + e);
			
		}
		
		private static function handleMicActivity(e:ActivityEvent):void {
			
			// dispatchEvent(new MicEvent(MicEvent.ACTIVITY_CHANGE, e.activityLevel));
			trace("handling mic Activity:" + e);
			// trace("event: " + e);
            // trace("event.activating: " + e.activating);

		}

	}
	
}