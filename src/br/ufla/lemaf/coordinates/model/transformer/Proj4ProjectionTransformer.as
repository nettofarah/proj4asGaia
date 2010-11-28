package br.ufla.lemaf.coordinates.model.transformer
{
	import br.ufla.lemaf.coordinates.model.Point;
	import br.ufla.lemaf.coordinates.model.ReferenceSystem;
	
	import org.openscales.proj4as.Proj4as;
	import org.openscales.proj4as.ProjPoint;
	import org.openscales.proj4as.ProjProjection;
	
	public class Proj4ProjectionTransformer implements ProjectionTransformer
	{
	
		
		public function transform(from:ReferenceSystem, to:ReferenceSystem, point:Point):Point
		{
			this.teach(from,to);
			
			var projFrom:ProjProjection = ProjProjection.getProjProjection(from.src);
			var projTo:ProjProjection = ProjProjection.getProjProjection(to.src);
			
			var projPoint:ProjPoint = new ProjPoint(point.x,point.y);			
			Proj4as.transform(projFrom, projTo, projPoint);
			
			return  Point.fromAxis(projPoint.x,projPoint.y);
		}
		
		private function teach(... refs:Array):void{
			for (var i:uint=0; i<refs.length;i++){
				ProjProjection.defs[refs[i].src] = refs[i].proj4;
			}
		}
	}
}