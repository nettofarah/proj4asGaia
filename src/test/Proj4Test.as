package test
{
	import mx.controls.Alert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.hamcrest.number.closeTo;
	import org.openscales.proj4as.Proj4as;
	import org.openscales.proj4as.ProjPoint;
	import org.openscales.proj4as.ProjProjection;

	public class Proj4Test
	{		
		
		private static var TOLERANCE:Number = 1;
		
		[Before]
		public function setUp():void{
			ProjProjection.defs["EPSG:4326"] = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs';
			ProjProjection.defs['EPSG:29182'] = '+proj=utm +zone=22 +south +ellps=GRS67 +units=m +no_defs';
		}
		
		[Test]
		public function shouldTransformFromGlobalToUTM22S():void{
			var projLongLat:ProjProjection = ProjProjection.getProjProjection('EPSG:4326');
			var projUTM:ProjProjection = ProjProjection.getProjProjection('EPSG:29182');
			
			var point:ProjPoint = new ProjPoint(-48.890625, -22.2290625);
			var expectedPoint:ProjPoint = new ProjPoint(717416.154336, 7540295.809134);
			
			Proj4as.transform(projLongLat,projUTM,point);
			
			assertThat(point.x, closeTo(expectedPoint.x,TOLERANCE));
			assertThat(point.y, closeTo(expectedPoint.y,TOLERANCE));
		}
	}
}