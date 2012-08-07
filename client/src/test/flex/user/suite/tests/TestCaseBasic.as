package flex.user.suite.tests {
import org.flexunit.Assert;

public class TestCaseBasic {

    public function TestCaseBasic() {

    }

    [Test(description="pierwszy test")]
    public function testMethod():void {
        var x:int = 5 + 3;
        Assert.assertEquals(8, x );
    }
}
}