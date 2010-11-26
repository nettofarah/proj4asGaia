package br.ufla.lemaf.coordinates.model.transformer
{
	import br.ufla.lemaf.coordinates.model.Point;
	import br.ufla.lemaf.coordinates.model.ReferenceSystem;
	
	public class DegreeMinutesSecondsProjectionTransformer implements ProjectionTransformer
	{
		
		private var transformerHelper:ProjectionTransformer = new Proj4ProjectionTransformer();
		
		public function transform(from:ReferenceSystem, to:ReferenceSystem, point:Point):Point
		{
			var degreesPoint:Point = this.transformerHelper.transform(from, 
												new ReferenceSystem("Coordenadas Geográficas Decimais","EPSG:4326","+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"),
												point);
			
			
			return null;
		}
	}
}