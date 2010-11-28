package br.ufla.lemaf.coordinates.model
{
	public class DMSCoordinate
	{
		
		private var _degree:Number;
		private var _minutes:Number;
		private var _seconds:Number;
		
		public function DMSCoordinate(degree:Number, minutes:Number, seconds:Number)
		{
			this._degree = degree;
			this._minutes = minutes;
			this._seconds = seconds;
		}
		
		public function get degree():Number{
			return _degree;
		}
		
		public function get minutes():Number{
			return _minutes;
		}
		
		public function get seconds():Number{
			return _seconds;
		}
		
		public function toCoordinate():Number{
			var seconds:Number = minutes * 60 + seconds;
			var fraction:Number = seconds / 3600;
			
			var value:Number = 0;
			
			if(degree > 0){
				value = degree + fraction;
			}else{
				value = degree - fraction;
			}
			
			return value;
		}
	}
}