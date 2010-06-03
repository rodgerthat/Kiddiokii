package states.playstate {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.media.Microphone;
	
	import media.KiddioMic;
	import media.KiddioMote;
	
	import effects.ColorfulCirclePrimaries;

	import org.wiiflash.Wiimote;
	import org.wiiflash.events.WiimoteEvent;
	
	public class EffectsViewer extends MovieClip {
	
		public var kiddioMic:Microphone;
		public var kiddioMote:Wiimote;
	
		private var effectsContainer:MovieClip;
		private var effectsContainerMask:MovieClip;
		
		private var micActivityLevel:Number;
		
		public function EffectsViewer() {
			
			kiddioMic = KiddioMic.getMicrophone();
			
			try {
			  kiddioMote = KiddioMote.getWiimote();
			}
			catch(e:Error) {
			  trace(e.message);
			}
			
			effectsContainer = new MovieClip();
			effectsContainer.graphics.beginFill(0xFFFFFF);
			effectsContainer.graphics.drawRoundRect(5,5,890,390,15,15);
			addChild(effectsContainer);
			
			effectsContainerMask = new MovieClip();
			effectsContainerMask.graphics.beginFill(0x000000);
			effectsContainerMask.graphics.drawRoundRect(5,5,890,390,15,15);
			
			effectsContainer.mask = effectsContainerMask;
			
			effectsContainer.addEventListener(Event.ENTER_FRAME, onEffectsContainerEnterFrame);
			
			super();
		}
		
		private function onEffectsContainerEnterFrame(e:Event):void {
			
				micActivityLevel = kiddioMic.activityLevel;
			
				if (micActivityLevel > 10) {
					
					try {
						drawEffect();
					}
					catch(e:Error) {
						trace("catching drawEffect errors");
						trace(e.message);
					}
					
				}
				
		}

		private function drawEffect():void {
			
				micActivityLevel = kiddioMic.activityLevel;
				var xPosition:Number = (stage.stageWidth / 2) + ((kiddioMote.balanceBoard.bottomLeftKg - kiddioMote.balanceBoard.topLeftKg) * 30);	
				var yPosition:Number = (stage.stageHeight / 2) + ((kiddioMote.balanceBoard.bottomRightKg - kiddioMote.balanceBoard.topRightKg) * 30);
				var scaleFactor:Number = (micActivityLevel / 100);
					
				var circle:ColorfulCirclePrimaries = new ColorfulCirclePrimaries();
				circle.x = xPosition;
				circle.y = yPosition;
				circle.scaleX = scaleFactor;
				circle.scaleY = scaleFactor;
				effectsContainer.addChild(circle);
			
		}

	}
	
}