package states.configstate {
	
	// import necessary classes
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import events.VolumeBarEvent;
	
	// class definition which inherits the functionality of the mighty MovieClip Class.  I was a wuss & didn't want to try and dump movieClips in sprites and vicea versa...
	public class VolumeBar extends MovieClip {
		
		// setup containers, scopped aporopos.
		private var track:Track_mc;
		private var thumb:Thumb_mc;
		private var thumbGrabbed:Boolean = false;
		private var thumbMouseDifference:Number = 0;
		
		public var positionUpdating:Boolean = false;
		
		//track width is 100pixels
		public static const TRACK_LENGTH:int = 370;
		
		// the CONSTRUCTOR
		public function VolumeBar() {
			
			// create the track for the scrubber, make it listen for the mouse and give it a mouseFINGER, add to display.
			track = new Track_mc();
			track.buttonMode = true;
			track.addEventListener(MouseEvent.CLICK,handleTrackClick);
			addChild(track);
			
			// create the thumb (knob) for the scrubber, make it listen to the mouse, give it a mouseFINGER, add to display.
			thumb = new Thumb_mc();
			thumb.buttonMode = true;
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, handleThumbMouseDown);
			addChild(thumb);
			
			// add event listener for this class to the stage.
			addEventListener(Event.ENTER_FRAME,handleEnterFrame);
			
			// call your parents.
			super();
			
		}
		
		// IF the thumb is grabbed by the mouse, then do THIS once per frame.
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
				dispatchEvent(new VolumeBarEvent(VolumeBarEvent.VOL_CHANGE,1-(thumb.y/(track.height-thumb.height))));
			}
		}
		
		// this is what to do when the USER clicks on the actual track, bypassing the thumb.
		
		private function handleTrackClick(e:MouseEvent):void {
			positionUpdating = true;
			thumb.x = mouseX;
			dispatchEvent(new VolumeBarEvent(VolumeBarEvent.VOL_CHANGE,1-(thumb.x/(track.width-thumb.width))));
		}

		
		/* when the primary mouse button is depressed on the thumb, add a listener for letting go of mouse button, 
		calculate the distance between the actual click and the top of the thumb.
		and yes, now the thumb is being grabbed. */
		private function handleThumbMouseDown(e:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_UP,handleThumbMouseUp);
			thumbMouseDifference = thumb.x - mouseX;
			thumbGrabbed = true;
		}
		
		/* when the USER releases the mouse button, the eventListener is removed, the thumb is no longer being grabbed, now the volume position IS updating, 
		and a custom event is dispached, containing the value to ship off to the jukebox, so it can adjust the volume accordingly. */
		private function handleThumbMouseUp(e:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_UP, handleThumbMouseUp);
			thumbGrabbed = false;
			positionUpdating = true;
			dispatchEvent(new VolumeBarEvent(VolumeBarEvent.VOL_CHANGE, 1-(thumb.x/(track.width-thumb.width))));
		}
		
	}
	
}