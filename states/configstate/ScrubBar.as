package states.configstate {
	
	//If you use it, you must import it ...
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import events.ScrubBarEvent;
	
	// class definition and inheiritance.
	public class ScrubBar extends MovieClip {
		
		private var track:Track_mc;
		private var thumb:Thumb_mc;
		private var thumbGrabbed:Boolean = false;
		private var thumbMouseDifference:Number = 0;
		
		public var positionUpdating:Boolean = false;
	
		//our tracks length is 370 pixels
		public static const TRACK_LENGTH:int = 370;
		
		// ye olde CONSTRUCTOR
		public function ScrubBar() {
			
			// create the track for the scrubber, make it listen for the mouse and give it a mouseFINGER, add to display.
			track = new Track_mc();
			track.buttonMode = true;
			track.addEventListener(MouseEvent.CLICK,handleTrackClick);
			addChild(track);
			
			// create the thumb (knob) for the scrubber, make it listen to the mouse, give it a mouseFINGER, add to display.
			thumb = new Thumb_mc();
			thumb.buttonMode = true;
			thumb.addEventListener(MouseEvent.MOUSE_DOWN,handleThumbMouseDown);
			addChild(thumb);
			
			// add event listener for this class to the stage.
			addEventListener(Event.ENTER_FRAME,handleEnterFrame);
			
			// call your parents.
			super();
			
		}
		
		// every time a frame goes by, and the thumb is being grabbed, 
		private function handleEnterFrame(e:Event):void {
			
			if (thumbGrabbed) {
				thumb.x = mouseX-Math.abs(thumbMouseDifference);
				if (thumb.x+thumb.width > track.width) {
					thumb.x = track.width-thumb.width;
				}
				if (thumb.x < 0) {
					thumb.x = 0;
				}
			}
		}
		
		/* when you click on the track, and not on the knob(thumb) the position is updating, 
		the thumb's x position is set to be whatever the mouse's x position is, and a new custom event is dispached.
		the event contains the number the jukebox will need to set the soundChannel.position */
		private function handleTrackClick(e:MouseEvent):void {
			positionUpdating = true;
			thumb.x = mouseX;
			dispatchEvent(new ScrubBarEvent(ScrubBarEvent.CHANGE, thumb.x/track.width));
		}
		
		/* when the mouse button is depressed over the thumb, a listener is added for it's release.
		the difference between the actual hotpixel CLICK and the thumb's X value is calculated.
		the thumb is now beign grabbed. */
		private function handleThumbMouseDown(e:MouseEvent):void {
			
			stage.addEventListener(MouseEvent.MOUSE_UP, handleThumbMouseUp);
			thumbMouseDifference = thumb.x - mouseX;
			thumbGrabbed = true;
		}
		
		/* when the mouse button is released, remove the listener for it, the thumb is no longer being grabbed,
		the thumb's position IS being updated, and a new custom event is dispatched, which contains the value of the position of the thumb where it was 'dropped' */
		private function handleThumbMouseUp(e:MouseEvent):void {
			
			stage.removeEventListener(MouseEvent.MOUSE_UP, handleThumbMouseUp);
			thumbGrabbed = false;
			positionUpdating = true;
			
			dispatchEvent(new ScrubBarEvent(ScrubBarEvent.CHANGE, thumb.x/track.width));
		}
		
	}
	
}