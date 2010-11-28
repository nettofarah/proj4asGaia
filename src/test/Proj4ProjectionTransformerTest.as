package test
{
	import br.ufla.lemaf.coordinates.model.Point;
	import br.ufla.lemaf.coordinates.model.ReferenceSystem;
	import br.ufla.lemaf.coordinates.model.transformer.Proj4ProjectionTransformer;
	import br.ufla.lemaf.coordinates.model.transformer.ProjectionTransformer;
	
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.number.closeTo;
	
	public class Proj4ProjectionTransformerTest
	{		
		
		private static var TOLERANCE:Number = 1;
		
		private var global:ReferenceSystem;
		private var utm:ReferenceSystem;
		private var sourcePoint:Point;
		private var transformer:ProjectionTransformer;
		
		[Before]
		public function setUp():void{
			global = new ReferenceSystem("Global", "EPSG:4326","+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs");
			utm = new ReferenceSystem("UTM 22 S", "EPSG:29182","+proj=utm +zone=22 +south +ellps=GRS67 +units=m +no_defs");
			
			sourcePoint = Point.fromAxis(-48.890625, -22.2290625);
			transformer = new Proj4ProjectionTransformer();
		}
		
		[Test]
		public function shouldTransformFromGlobalToUTM22S():void
		{
			var expectedPoint:Point = Point.fromAxis(717416.154336, 7540295.809134);
			var utmPoint:Point = transformer.transform(global,utm,sourcePoint);

			assertCloseTo(utmPoint,expectedPoint);
		}
		
		[Test]
		public function shouldReturnTheSamePointForAnInvalidReference():void{
			var invalid:ReferenceSystem = new ReferenceSystem("Invalid Reference System","INVALID_EPSG","invalid projection");
			var invalidPoint:Point = transformer.transform(global,invalid,sourcePoint);
			
			assertTrue(ObjectUtil.compare(invalidPoint,sourcePoint) == 0);
		}
		
		private function assertCloseTo(point:Point, pointToBeClose:Point):void{
			assertThat(point.x, closeTo(pointToBeClose.x,TOLERANCE));
			assertThat(point.y, closeTo(pointToBeClose.y,TOLERANCE));
		}
	}
}