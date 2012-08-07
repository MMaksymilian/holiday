package flex.admin.suite {
import flex.admin.suite.tests.TestCaseBasic;

    [Suite]
    [RunWith("org.flexunit.runners.Suite")]
    public class TestSuite {

       public function TestSuite() {

       }

       public var adminTest: TestCaseBasic;
    }
}