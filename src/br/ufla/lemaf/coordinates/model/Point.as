package br.ufla.lemaf.coordinates.model
{
	import mx.charts.chartClasses.NumericAxis;

	[Bindable]
	public class Point
	{
		
		private var _x:Number;
		private var _y:Number;
		
		public static function fromAxis(x:Number,y:Number):Point{
			var point:Point = new Point();
			point._x = x;
			point._y = y;
			
			return point;
		}
		
		public static function fromDMS(x:DMSCoordinate, y:DMSCoordinate):Point{
			return new DMSPoint(x,y);
		}
		
		public function get x():Number{
			return _x;
		}
		
		public function get y():Number{
			return _y;
		}
		
		public function get xDegrees():Number{
			return toDegrees(x);
		}
		
		public function get yDegrees():Number{
			return toDegrees(y);
		}
		
		public function get xMinuts():Number{
			return toMinutes(x);
		}
		
		public function get yMinuts():Number{
			return toMinutes(y);
		}
		
		private function toDegrees(value:Number):Number{
			var vs:String = value.toString();
			return new Number(vs.split(".")[0]);
		}
		
		public function get xSeconds():Number{
			return toSeconds(x);
		}
		
		public function get ySeconds():Number{
			return toSeconds(y);
		}
		
		private function toSeconds(number:Number):Number{
			var fraction:Number = separateCoordinate(number)[1];
			fraction = new Number((fraction * 60).toString().substr(2));
			return new Number((fraction * 60).toString().substr(0,2));
		}
		
		private function toMinutes(number:Number):Number{
			var fraction:Number = separateCoordinate(number)[1];
			var minuts:Number = fraction * 60;
			return new Number(minuts.toString().substr(0,2));
		}
		
		
		private function separateCoordinate(coordinate:Number):Array{
			var split:Array = coordinate.toString().split(".");
			return [new Number(split[0]), new Number(split[1]) ];
		}
	}
}