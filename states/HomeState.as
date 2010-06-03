package states {
	
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import com.pixelfumes.reflect.Reflect;
	
	import events.ViewChangeEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import states.homestate.Detector;
	import states.homestate.KiddioTitle;
	
	public class HomeState extends MovieClip {
		
		private var kiddioTitle:KiddioTitle;
		private var detector:Detector;
		
		private var kiddioReflect:Reflect;
		private var detectorReflect:Reflect;
		
		public function HomeState() {
			
			kiddioTitle = new KiddioTitle();
			kiddioTitle.x = 150;
			kiddioTitle.y = 90;
			addChild(kiddioTitle);
			
			kiddioReflect = new Reflect({mc:kiddioTitle, alpha:50, ratio:200, distance:200, updateTime:0, reflectionDropoff:0});
			
			detector = new Detector();
			detector.x = 290;
			detector.y = 610;
			addChild(detector);
			
			// detectorReflect = new Reflect({mc:detector, alpha:50, ratio:133, distance:10, updateTime:0, reflectionDropoff:0});
			
			super();
			
		}
		
		private function handleConfigBtnMouseDown(e:MouseEvent):void {
			
		}
		
		private function handleConfigBtnMouseUp(e:MouseEvent):void {
			
			dispatchEvent(new ViewChangeEvent(ViewChangeEvent.CHANGE, "config"));
			
		}
		
		public function initialize() {
			
			kiddioTitle.initialize();
			
			TweenMax.to(detector, 1, {y:260, delay:1, ease:Bounce.easeOut});
			
		}
		
		public function retract() {
			
			kiddioTitle.retract();
			
			TweenMax.to(detector, 1, {y:610, delay:0.3, ease:Bounce.easeOut});
			
		}
		
	}
	
}
