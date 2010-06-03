package effects {
	
	import flash.display.*;
	import flash.events.*;

	public class ColorfulCirclePrimaries extends MovieClip {

		private var speed:Number;
		private var colorArray:Array;
		private var randomPrimary:Number;
		private var circle:Sprite;
		
		public function ColorfulCirclePrimaries() {
				
				speed = .01 + .02 * Math.random();
				
				colorArray = new Array(0xFF0000,0x007700,0x0000FF,0xFFFF00);
				
				randomPrimary = Math.floor(Math.random()*colorArray.length);
				
				circle = new Sprite();
				circle.graphics.beginFill(colorArray[randomPrimary]);
				// circle.graphics.drawEllipse(0,0,100,100);
				//	Warning: 1060: Migration Issue: The Method drawCircle is no longer supported.  Use the graphics.drawOval method instead...
				// Warning: 707: loling.
				circle.graphics.drawCircle(0,0,100);
				circle.alpha = .5;
				addChild(circle);
				circle.addEventListener(Event.ENTER_FRAME, fadeCircleOut);
				
			}
		
			public function fadeCircleOut(e:Event) {
				
				circle.alpha -= .5 * speed;
				circle.scaleX += 5 * speed;
				circle.scaleY += 5 * speed;
				
				if (circle.alpha < 0) {
					circle.removeEventListener(Event.ENTER_FRAME, fadeCircleOut);
					removeChild(circle);
				}
				
			}
			
	}
	
}