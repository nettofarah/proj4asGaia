package test{
	import br.ufla.lemaf.coordinates.model.DMSCoordinate;
	import br.ufla.lemaf.coordinates.model.DMSPoint;
	import br.ufla.lemaf.coordinates.model.Point;
	
	import org.flexunit.asserts.assertEquals;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;
	import org.hamcrest.number.closeTo;
	import org.hamcrest.object.instanceOf;

	public class PointTest{
		
		[Test]
		public function shouldCreatAPointFromCoordinates():void{
			var point:Point = Point.fromAxis(0,0);
			assertThat(point,instanceOf(Point));
		}
		
		[Test]
		public function shouldCreateAPointFromDMS():void{
			var point:Point = Point.fromDMS(new DMSCoordinate(0,0,0), new DMSCoordinate(0,0,0) );
			assertThat(point, instanceOf(DMSPoint));
		}
		
		[Test]
		public function shouldRepresentAPointAsDegreeMinuteAndSecond():void{
			var point:Point = Point.fromAxis(-87.728055, -87.728055);
			
			var xDegrees:Number = point.xDegrees;
			var yDegrees:Number = point.yDegrees;
			
			var xMinutes:Number = point.xMinuts;
			var yMinutes:Number = point.yMinuts;
			
			var xSeconds:Number = point.xSeconds;
			var ySeconds:Number = point.ySeconds;
			
			assertEquals(xDegrees, -87);
			assertEquals(yDegrees,-87);
			
			assertEquals(43, xMinutes);
			assertEquals(43, yMinutes);
			
			assertThat( xSeconds, closeTo(40,1));
			assertThat( ySeconds, closeTo(40,1));
		}
		
		[Test]
		public function shouldRepresentADMSasPoint():void{
			var point:Point = Point.fromDMS( new DMSCoordinate(-87,43,40), new DMSCoordinate(-87,43,40) );
			
			var x:Number = point.x;
			var y:Number = point.y;
			
			assertEquals(point.xDegrees, -87 );
			assertEquals(point.yDegrees, -87 );
			
			assertEquals(point.xMinuts, 43 );
			assertEquals(point.yMinuts, 43 );
			
			assertEquals(point.xSeconds, 40 );
			assertEquals(point.ySeconds, 40 );
			
			assertThat( x, closeTo( -87.728055, 1) );
			
			assertThat( y, closeTo( -87.728055, 1) );
		}
		
	}
}