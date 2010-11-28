package br.ufla.lemaf.coordinates.model
{
	public class DMSPoint extends Point
	{
		
		private var _xDMS:DMSCoordinate;
		private var _yDMS:DMSCoordinate;
		
		public function DMSPoint(x:DMSCoordinate, y:DMSCoordinate){
			this._xDMS = x;
			this._yDMS = y;
		}
		
		override public function get x():Number{
			return _xDMS.toCoordinate();
		}
		
		override public function get y():Number{
			return _yDMS.toCoordinate();
		}
		
		override public function get xDegrees():Number{
			return _xDMS.degree;
		}
		
		override public function get yDegrees():Number{
			return _yDMS.degree;
		}
		
		override public function get xMinuts():Number{
			return _xDMS.minutes;
		}
		
		override public function get yMinuts():Number{
			return _yDMS.minutes;
		}
		
		override public function get xSeconds():Number{
			return _xDMS.seconds;
		}
		
		override public function get ySeconds():Number{
			return _yDMS.seconds;
		}
	}
}