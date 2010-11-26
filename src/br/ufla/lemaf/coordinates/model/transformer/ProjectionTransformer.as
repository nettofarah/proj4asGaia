package br.ufla.lemaf.coordinates.model.transformer
{
	import br.ufla.lemaf.coordinates.model.Point;
	import br.ufla.lemaf.coordinates.model.ReferenceSystem;

	public interface ProjectionTransformer
	{
		function transform(from:ReferenceSystem,to:ReferenceSystem,point:Point):Point;
	}
}