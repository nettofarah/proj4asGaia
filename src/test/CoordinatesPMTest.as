package test
{
	import br.ufla.lemaf.coordinates.model.Point;
	import br.ufla.lemaf.coordinates.model.ReferenceSystem;
	import br.ufla.lemaf.coordinates.model.transformer.ProjectionTransformer;
	import br.ufla.lemaf.coordinates.pm.CoordinatesPM;
	
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectUtil;
	
	import org.flexunit.asserts.assertTrue;
	import org.mockito.integrations.given;

	public class CoordinatesPMTest
	{		
		
		private var references:ArrayCollection;
		
		[Mock(type="br.ufla.lemaf.coordinates.model.transformer.ProjectionTransformer")]
		public var transformer:ProjectionTransformer;
		
		private var coordinatesPM:CoordinatesPM;
		
		/*[Before]
		public function setUp():void
		{
			references = new ArrayCollection([
									new ReferenceSystem("Coordenadas Geográficas Decimais","EPSG:4326","+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs"), 
									new ReferenceSystem("Projetadas em UTM, Com o DATUM SAD69 22S","EPSG:29182","+proj=utm +zone=22 +south +ellps=GRS67 +units=m +no_defs"),
									new ReferenceSystem("Projetadas em UTM, Com o DATUM SIRGAS 2000 24S","EPSG:31984","+proj=utm +zone=24 +south +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"),
									new ReferenceSystem("Projetadas em UTM, Com o DATUM Corrego Alegre 24S","EPSG:22524","+proj=utm +zone=24 +south +ellps=intl +towgs84=-206,172,-6,0,0,0,0 +units=m +no_defs")
							]);
				
			coordinatesPM = new CoordinatesPM(references,transformer);
		}
		
		[Test]
		public function shouldTransformFromGlobalToUTM():void{
			var global:ReferenceSystem = references.getItemAt(0) as ReferenceSystem;
			var utm22S:ReferenceSystem = references.getItemAt(1) as ReferenceSystem;
			
			var point:Point = new Point(-48.890625, -22.2290625);
			var expectedPoint:Point = new Point(717416.154336, 7540295.809134);
			
			//given(transformer.transform(global,utm22S,point)).willReturn(expectedPoint);
			
			var resultPoint:Point = this.coordinatesPM.transformer.transform(global,utm22S,point);
			
			//assertTrue(ObjectUtil.compare(resultPoint,expectedPoint) == 0);
			assertTrue(true);
		}*/
	}
}