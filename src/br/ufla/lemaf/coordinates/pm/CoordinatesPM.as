package br.ufla.lemaf.coordinates.pm
{
	import br.ufla.lemaf.coordinates.model.Point;
	import br.ufla.lemaf.coordinates.model.ReferenceSystem;
	import br.ufla.lemaf.coordinates.model.transformer.ProjectionTransformer;
	
	import mx.collections.ArrayCollection;
	
	import org.openscales.proj4as.Proj4as;
	import org.openscales.proj4as.ProjPoint;
	import org.openscales.proj4as.ProjProjection;

	[Bindable]
	public class CoordinatesPM
	{
		private var _availableSystems:ArrayCollection = new ArrayCollection();
		public var point:Point = Point.fromAxis(0,0);
		public var transformer:ProjectionTransformer;
		
		public function CoordinatesPM(coordinateSystems:ArrayCollection, transformer:ProjectionTransformer){
			this._availableSystems = coordinateSystems;
			this.transformer = transformer;
		}
		
		public function get availableSystems():ArrayCollection{
			return this._availableSystems;
		}
		
		
		public function changeReference(from:ReferenceSystem,to:ReferenceSystem):void{
			this.point = this.transformer.transform(from,to,this.point);
		}
	}
}