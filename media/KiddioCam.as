package media {
	
	import flash.events.ActivityEvent;
	import flash.media.Camera;
	import flash.system.Security;
	import flash.system.SecurityPanel;
	
	public class KiddioCam {
		
		private static const CAMERA_WIDTH:int = 320;
		private static const CAMERA_HEIGHT:int = 240;
		private static const FPS:int = 15;
		
		private static var cam:Camera;
		
		public function KiddioCam() {
			
			
		}
		
		public static function getCamera():Camera {
			
			cam = Camera.getCamera();
			cam.setQuality(0,100);
			cam.setLoopback(true);
			cam.setMode(CAMERA_WIDTH,CAMERA_HEIGHT,FPS,true);
			
			cam.addEventListener(ActivityEvent.ACTIVITY, handleCamActivity);
			
			return cam;
			
		}
		
		private static function handleCamActivity(e:ActivityEvent):void {
			
			trace("handling CAMERA activity");
			
		}

	}
	
}