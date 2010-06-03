package states.playstate {
	
	import flash.display.MovieClip;
	import flash.events.ActivityEvent;
	import flash.media.Camera;
	import flash.media.Video;
	import flash.text.TextField;
	
	import media.KiddioCam;

	public class CamViewer extends MovieClip {
		
		private var camBorder:Webcam_viewer_border_mc;
		
		private const CAMERA_WIDTH:int = 320;
		private const CAMERA_HEIGHT:int = 240;
		private const FPS:int = 15;
		
		public var kiddioCam:Camera;
		
		private var vid:Video;
		
		private var scoreField:TextField;
		
		public function CamViewer() {
			
			// Get the camera
			
			kiddioCam = KiddioCam.getCamera();
			
			// setup video object and attach camera to it
							
			vid = new Video(CAMERA_WIDTH, CAMERA_HEIGHT);
			
			vid.x = 20;
			vid.y = 20;
			
			vid.attachCamera(kiddioCam);
			
			addChild(vid);
			
			scoreField = new TextField();
			
			
			camBorder = new Webcam_viewer_border_mc();
			camBorder.x = 0;
			camBorder.y = 0;
			addChild(camBorder);
			
			super();
		}

		
	}
	
}