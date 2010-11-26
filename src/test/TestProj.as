package test
{
	import flashx.textLayout.debug.assert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertTrue;
	import org.hamcrest.core.isA;
	import org.openscales.proj4as.Proj4as;
	import org.openscales.proj4as.ProjPoint;
	import org.openscales.proj4as.ProjProjection;
	
	public class TestProj
	{			
		
		[Test]
		public function shouldTransform():void{
			var source:ProjProjection = new ProjProjection("EPSG:29182");
			var dest:ProjProjection = new ProjProjection("SR-ORG:10");
			
			var sourcePoint:ProjPoint = new ProjPoint(-43.119697,-19.851838);
			var resultPoint:ProjPoint = sourcePoint.clone();
			
			
			Proj4as.transform(source,dest,sourcePoint);
			
			assertTrue(sourcePoint != resultPoint);
		}
	}
}