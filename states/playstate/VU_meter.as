package states.playstate {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.media.Microphone;
	import media.KiddioMic;
	
	public class VU_meter extends MovieClip {
		
		private var indicatorWheelBG:Indicator_wheel_bg_mc;
		private var vu_meter:VU_meter_mc;
		
		private var kiddioMic:Microphone;
		
		private var frame:Number;
		private var micActivityLevel:Number;
		private var modMicActivityLevel:Number;
		
		public function VU_meter() {
			
			kiddioMic = KiddioMic.getMicrophone();
			
			indicatorWheelBG = new Indicator_wheel_bg_mc();
			indicatorWheelBG.x = 0;
			indicatorWheelBG.y = 0;
			addChild(indicatorWheelBG);
			
			vu_meter = new VU_meter_mc();
			vu_meter.x = 22;
			vu_meter.y = 22;
			vu_meter.gotoAndStop(1);
			addChild(vu_meter);
			
			// vu_meter.addEventListener(MicEvent.CHANGE, handleMicActivityLevel);
			vu_meter.addEventListener(Event.ENTER_FRAME, handleVUMeterEnterFrame);
			super();
		}
		
		/*
		private function handleMicActivityLevel(e:MicEvent):void {
			
			trace("VU_meter handling MicEvent: " + e.micActivityLevel);
			
			frame = Math.abs(Math.round(e.micActivityLevel * 1));
			
			vu_meter.gotoAndStop(frame);

			
		}
		*/
		
		private function handleVUMeterEnterFrame(e:Event):void {
			
			micActivityLevel = kiddioMic.activityLevel;
			
			modMicActivityLevel = Math.abs(micActivityLevel * 5);
			
			frame = Math.abs(Math.round(micActivityLevel * 1));
			
			vu_meter.gotoAndStop(frame);
			
		}
		
	}
	
}