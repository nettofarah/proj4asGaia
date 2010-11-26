package br.ufla.lemaf.coordinates.model
{
	[Bindable]
	public class Point
	{
		
		private var _x:Number;
		private var _y:Number;
		
		public function Point(x:Number, y:Number)
		{
			this._x = x;
			this._y = y;
		}
		
		public function get x():Number{
			return _x;
		}
		
		public function get y():Number{
			return _y;
		}
	}
}