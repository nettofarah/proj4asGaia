package br.ufla.lemaf.coordinates.model
{
	public class ReferenceSystem
	{
		private var _title:String;
		private var _src:String;
		private var _proj4:String;
		
		public function ReferenceSystem(title:String, src:String, proj4Def:String)
		{
			this._title = title;
			this._src = src;
			this._proj4 = proj4Def;
		}
		
		public function get title():String{
			return _title;
		}
		
		public function get src():String{
			return _src;
		}
		
		public function get proj4():String{
			return _proj4;
		}
		
		public function toString():String{
			return title + " - " + src;
		}
	}
}