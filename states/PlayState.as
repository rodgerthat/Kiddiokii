package states {
	
	import com.greensock.*;
	import com.greensock.easing.*;
	
	import com.pixelfumes.reflect.Reflect;
	
	import events.ViewChangeEvent;
	
	import flash.display.MovieClip;
	import flash.events.ActivityEvent;
	import flash.events.MouseEvent;
	import flash.events.StatusEvent;
	import flash.media.Microphone;
	
	import media.KiddioMic;
	
	import states.playstate.EffectsViewer;
	
	import states.playstate.CamViewer;
	import states.playstate.HomeBtn;
	import states.playstate.SongIndicator;
	import states.playstate.SongPlayer;
	import states.playstate.VU_meter;

	public class PlayState extends MovieClip {
		
		private var kiddioMic:Microphone;
		
		private var reflectContainer:MovieClip;
		private var reflectContainerReflection:Reflect;
		
		private var effectsViewer:EffectsViewer;
		private var camViewer:CamViewer;
		
		public var songPlayer:SongPlayer;
		
		private var songIndicator:SongIndicator;
		private var vu_meter:VU_meter;
		private var homeBtn:HomeBtn;
		private var configBtnWheelBG:Indicator_wheel_bg_mc;
		
		private static const INIT_DELAY:Number = 0.7;
		
		private static const INIT_DUR:Number = 1.5;
		private static const RETR_DUR:Number = 1.3;
		
		public function PlayState() {
			
			kiddioMic = KiddioMic.getMicrophone();
			
			reflectContainer = new MovieClip();
			addChild(reflectContainer);
			
			effectsViewer = new EffectsViewer();
			effectsViewer.x = 0;
			effectsViewer.y = 0;
			reflectContainer.addChild(effectsViewer);
			
			reflectContainerReflection = new Reflect({mc:reflectContainer, alpha:50, ratio:255, distance:0, updateTime:0, reflectionDropoff:0});
			
			camViewer = new CamViewer();
			camViewer.x = 270;
			camViewer.y = -290;
			addChild(camViewer);
			
			songPlayer = new SongPlayer();
			songPlayer.x = 171;
			songPlayer.y = 610;
			addChild(songPlayer);
			
			songIndicator = new SongIndicator();
			songIndicator.x = -300;
			songIndicator.y = 750;
			addChild(songIndicator);
			
			vu_meter = new VU_meter();
			vu_meter.x = 1050;
			vu_meter.y = 750;
			addChild(vu_meter);
			
			homeBtn = new HomeBtn();
			homeBtn.x = 1200;
			homeBtn.y = -300;
			homeBtn.buttonMode = true;
			homeBtn.addEventListener(MouseEvent.MOUSE_OVER, handleHomeBtnMouseOver);
			homeBtn.addEventListener(MouseEvent.MOUSE_OUT, handleHomeBtnMouseOut);
			homeBtn.addEventListener(MouseEvent.MOUSE_DOWN, handleHomeBtnMouseDown);
			homeBtn.addEventListener(MouseEvent.MOUSE_UP, handleHomeBtnMouseUp);
			addChild(homeBtn);
			
			configBtnWheelBG = new Indicator_wheel_bg_mc();
			configBtnWheelBG.x = -300;
			configBtnWheelBG.y = -300;
			addChild(configBtnWheelBG);
			
			super();
		}
		
		private function handleMicStatus(e:StatusEvent):void {
			
			// trace("handling mic Status:" + e);
			
		}
		
		private function handleMicActivity(e:ActivityEvent):void {
			
			// trace("kiddioMic.activiyLevel = " + kiddioMic.activityLevel);
			
			// dispatchEvent(new MicEvent(MicEvent.ACTIVITY_CHANGE, kiddioMic.activityLevel));
			// trace("handling mic Activity:" + e);
            // trace("event.activating: " + e.activating);

		}
		
		private function handleHomeBtnMouseOver(e:MouseEvent):void {
			
			
		}
		
		private function handleHomeBtnMouseOut(e:MouseEvent):void {
			
			
		}
		
		private function handleHomeBtnMouseDown(e:MouseEvent):void {
			
			
		}
		
		private function handleHomeBtnMouseUp(e:MouseEvent):void {
			
			dispatchEvent(new ViewChangeEvent(ViewChangeEvent.CHANGE, "title"));
			
			songPlayer.packItUp();
			
		}
		
		public function initialize() {
	
			TweenMax.to(camViewer, INIT_DUR, {delay:INIT_DELAY, y:2, ease:Bounce.easeOut});
			
			TweenMax.to(songPlayer, INIT_DUR, {delay:INIT_DELAY, y:265, ease:Elastic.easeOut});
			
			TweenMax.to(songIndicator, INIT_DUR, {delay:INIT_DELAY, x:-150, y:450, ease:Elastic.easeOut});
			
			TweenMax.to(vu_meter, INIT_DUR, {delay:INIT_DELAY, x:750, y:450, ease:Elastic.easeOut});
			
			TweenMax.to(configBtnWheelBG, INIT_DUR, {delay:INIT_DELAY, x:-150, y:-150, ease:Elastic.easeOut});
			
			TweenMax.to(homeBtn, INIT_DUR, {delay:INIT_DELAY, x:750, y:-150, ease:Elastic.easeOut});
			
		}
		
		public function retract() {
						
			TweenMax.to(camViewer, RETR_DUR, {y:-290, ease:Bounce.easeIn});
			
			TweenMax.to(songPlayer, RETR_DUR, {y:610, ease:Elastic.easeIn});
			
			TweenMax.to(songIndicator, RETR_DUR, {x:-300, y:750, ease:Elastic.easeIn});
			
			TweenMax.to(vu_meter, RETR_DUR, {x:1050, y:750, ease:Elastic.easeIn});
			
			TweenMax.to(configBtnWheelBG, RETR_DUR, {x:-300, y:-300, ease:Elastic.easeIn});
			
			TweenMax.to(homeBtn, RETR_DUR, {x:1200, y:-300, ease:Elastic.easeIn});
			
		}
		
	}
	
}