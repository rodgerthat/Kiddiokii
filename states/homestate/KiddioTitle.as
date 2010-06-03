package states.homestate {
	
	import flash.display.MovieClip;
	
	import com.greensock.*;
	import com.greensock.easing.*;

	public class KiddioTitle extends MovieClip {
		
		private var k1:K_mc;
		private var i2:I_mc;
		private var d3:D_mc;
		private var d4:D_mc;
		private var i5:I_mc;
		private var o6:O_mc;
		private var k7:K_mc;
		private var i8:I_mc;
		private var i9:I_mc;
		
		private static const Y_HEIGHT = -220;
		
		private static const INIT_DUR = 1.7;
		private static const RETR_DUR = 0.5;
		
		public function KiddioTitle() {

			k1 = new K_mc();
			k1.x = 0;
			k1.y = Y_HEIGHT;
			addChild(k1);
			
			i2 = new I_mc();
			i2.x = 84;
			i2.y = Y_HEIGHT;
			addChild(i2);
			
			d3 = new D_mc();
			d3.x = 137;
			d3.y = Y_HEIGHT;
			addChild(d3);
			
			d4 = new D_mc();
			d4.x = 217;
			d4.y = Y_HEIGHT;
			addChild(d4);
			
			i5 = new I_mc();
			i5.x = 303;
			i5.y = Y_HEIGHT;
			addChild(i5);
			
			o6 = new O_mc();
			o6.x = 357;
			o6.y = Y_HEIGHT;
			addChild(o6);
			
			k7 = new K_mc();
			k7.x = 444;
			k7.y = Y_HEIGHT;
			addChild(k7);
			
			i8 = new I_mc();
			i8.x = 530;
			i8.y = Y_HEIGHT;
			addChild(i8);
			
			i9 = new I_mc();
			i9.x = 588;
			i9.y = Y_HEIGHT;
			addChild(i9);
			
			super();
		}
		
		public function initialize() {
			
			TweenMax.to(k1, INIT_DUR, {delay:1.0, x:0, y:0, ease:Elastic.easeOut});
			TweenMax.to(i2, INIT_DUR, {delay:1.1, x:84, y:4, ease:Elastic.easeOut});
			TweenMax.to(d3, INIT_DUR, {delay:1.2, x:137, y:0, ease:Elastic.easeOut});
			TweenMax.to(d4, INIT_DUR, {delay:1.3, x:217, y:0, ease:Elastic.easeOut});
			TweenMax.to(i5, INIT_DUR, {delay:1.4, x:303, y:4, ease:Elastic.easeOut});
			TweenMax.to(o6, INIT_DUR, {delay:1.5, x:357, y:38, ease:Elastic.easeOut});
			TweenMax.to(k7, INIT_DUR, {delay:1.6, x:444, y:0, ease:Elastic.easeOut});
			TweenMax.to(i8, INIT_DUR, {delay:1.7, x:530, y:4, ease:Elastic.easeOut});
			TweenMax.to(i9, INIT_DUR, {delay:1.8, x:588, y:4, ease:Elastic.easeOut});
			
		}
		
		public function retract() {
			
			TweenMax.to(k1, RETR_DUR, {y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(i2, RETR_DUR, {delay:0.1, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(d3, RETR_DUR, {delay:0.2, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(d4, RETR_DUR, {delay:0.3, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(i5, RETR_DUR, {delay:0.4, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(o6, RETR_DUR, {delay:0.5, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(k7, RETR_DUR, {delay:0.6, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(i8, RETR_DUR, {delay:0.7, y:Y_HEIGHT, ease:Back.easeIn});
			TweenMax.to(i9, RETR_DUR, {delay:0.8, y:Y_HEIGHT, ease:Back.easeIn});
			
		}
		
	}
	
}