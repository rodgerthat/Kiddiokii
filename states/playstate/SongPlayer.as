package states.playstate {
	
	import fl.video.FLVPlayback;
	import fl.video.*;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class SongPlayer extends MovieClip {
		
		private var videoArray:Array;
		
		private var currentVideo:Number;
		
		private var flvPlayback:FLVPlayback;
		
		private var songPlayerFrame:Song_player_frame_mc;
		
		private var backBtn:Back_btn_mc;
		private var playBtn:Play_btn_mc;
		private var stopBtn:Stop_btn_mc;
		private var pauseBtn:Pause_btn_mc;
		private var nextBtn:Next_btn_mc;
		
		public function SongPlayer() {
			
			videoArray = new Array("videos/twinkle_twinkle.flv","videos/ABC_txt_scroll.flv");
			
			currentVideo = 0;
			
			flvPlayback = new FLVPlayback();
			flvPlayback.width = 521;
			flvPlayback.height = 255;
			flvPlayback.x = 17;
			flvPlayback.y = 16;
			flvPlayback.load(videoArray[0]);
			flvPlayback.addEventListener(VideoEvent.COMPLETE, handleVideoComplete);
			addChild(flvPlayback);
			
			songPlayerFrame = new Song_player_frame_mc();
			songPlayerFrame.x = 0;
			songPlayerFrame.y = 0;
			addChild(songPlayerFrame);
			
			backBtn = new Back_btn_mc();
			backBtn.x = 39;
			backBtn.y = 281;
			backBtn.buttonMode = true;
			backBtn.addEventListener(MouseEvent.MOUSE_UP, handleBackBtnMouseUp);
			addChild(backBtn);
			
			playBtn = new Play_btn_mc();
			playBtn.x = 148;
			playBtn.y = 283;
			playBtn.buttonMode = true;
			playBtn.addEventListener(MouseEvent.MOUSE_UP, handlePlayBtnMouseUp);
			addChild(playBtn);
			
			stopBtn = new Stop_btn_mc();
			stopBtn.x = 254;
			stopBtn.y = 282;
			stopBtn.buttonMode = true;
			stopBtn.addEventListener(MouseEvent.MOUSE_UP, handleStopBtnMouseUp);
			addChild(stopBtn);
			
			pauseBtn = new Pause_btn_mc();
			pauseBtn.x = 360;
			pauseBtn.y = 281;
			pauseBtn.buttonMode = true;
			pauseBtn.addEventListener(MouseEvent.MOUSE_UP, handlePauseBtnMouseUp);
			addChild(pauseBtn);
			
			nextBtn = new Next_btn_mc();
			nextBtn.x = 465;
			nextBtn.y = 282;
			nextBtn.buttonMode = true;
			nextBtn.addEventListener(MouseEvent.MOUSE_UP, handleNextBtnMouseUp);
			addChild(nextBtn);
			
			super();
		}

		private function handleVideoComplete (e:VideoEvent):void {
			
			if (currentVideo == 5) {
				currentVideo = 0;
				flvPlayback.load(videoArray[0]);
			} else {
				flvPlayback.load(videoArray[(currentVideo + 1)]);
			}
			
		}
		
		private function handleBackBtnMouseUp(e:MouseEvent):void {
			
			if(currentVideo > 0) {
				currentVideo--;
			} else {
				currentVideo = videoArray.length - 1; 
			}
			
			flvPlayback.load(videoArray[currentVideo]);
			
		}
		
		private function handlePlayBtnMouseUp(e:MouseEvent):void {
			
			flvPlayback.play();
			
		}
		
		private function handleStopBtnMouseUp(e:MouseEvent):void {
			
			flvPlayback.stop();
			
		}
		
		private function handlePauseBtnMouseUp(e:MouseEvent):void {
			
			flvPlayback.pause();
			
		}
		
		private function handleNextBtnMouseUp(e:MouseEvent):void {
			
			if(currentVideo < videoArray.length - 1) {
					currentVideo++;
			} else {
					currentVideo = 0; 
			}
			
			flvPlayback.load(videoArray[currentVideo]);
			
		}
		
		public function packItUp():void {
			
			flvPlayback.stop();
			flvPlayback.load(videoArray[0]);
			
			currentVideo = 0;
			
		}
		
		public function pauseIt():void {
			
			flvPlayback.pause();
			
		}
		
		public function resumeIt():void {
			
			flvPlayback.play();
			
		}
		
	}
	
}