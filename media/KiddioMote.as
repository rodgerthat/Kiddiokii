package media {
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	
	import org.wiiflash.Wiimote;
	import org.wiiflash.events.WiimoteEvent;
	
	public class KiddioMote {
		
		private static var mote:Wiimote;
		
		public function KiddioMote() {
			
			super();
			
		}
		
		public static function getWiimote():Wiimote {
			
			// setup the wiimote
			mote = new Wiimote();
			mote.addEventListener(Event.CONNECT, onWiimoteConnect);
			mote.addEventListener(Event.CLOSE, onWiimoteDisconnected);
			mote.connect();
	
			// listen for the balance board
			mote.addEventListener(WiimoteEvent.BALANCEBOARD_CONNECT, onBalanceBoardConnected);
			mote.addEventListener(WiimoteEvent.BALANCEBOARD_DISCONNECT, onBalanceBoardDisconnected);
			
			mote.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			mote.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			
			return mote;
			
		}
		
		
		private static function onWiimoteConnect(e:WiimoteEvent):void {
				trace("wiiMote CONnected");
		}

		private static function onWiimoteDisconnected(e:WiimoteEvent):void {
				trace("wiiMote DISconnected");
		}

		private static function onBalanceBoardConnected(e:WiimoteEvent):void {
				trace("balanceBoard CONnected");
		}

		private static function onBalanceBoardDisconnected(e:WiimoteEvent):void {
				trace("balanceBoard DISconnected");
		}
		
		private static function errorHandler(e:IOErrorEvent):void {
			trace("handling mote IOErrorEvent");
			trace(e.text); 
		}
		
		private static function securityErrorHandler(e:SecurityErrorEvent):void {
			trace("handling mote SecurityErrorEvent");
			trace(e.text);
		}
		

	}
	
}