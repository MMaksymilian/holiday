package {
import org.flexunit.Assert;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class FirstTest {

        var string:String;

        [Test]
        public function testMethod():void {
            var x:int = 5 + 3;
            Assert.assertEquals(8, x );
        }
    }
}