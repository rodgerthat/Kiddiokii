package effects {
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	
	public class ColorfulCircle extends Sprite {
			
			private var speed:Number;
			private var circle:Sprite;
			
			public function ColorfulCircle() {
				
				speed = .01 + .02 * Math.random();
				
				circle = new Sprite();
				
				circle.graphics.beginFill(Math.random() * 0xFFFFFF);
				circle.graphics.drawCircle(0,0,100);
				circle.alpha = .5;
				addChild(circle);
				circle.addEventListener(Event.ENTER_FRAME, fadeCircleOut);
				
			}
		
			public function fadeCircleOut(e:Event) {
				
				e.alpha -= .5 * speed;
				e.scaleX += 5 * speed;
				e.scaleY += 5 * speed;
				
				if (circle.alpha < 0) {
					circle.removeEventListener(Event.ENTER_FRAME, fadeCircleOut);
					removeChild(circle);
				}
				
			}

	}
		
}