package flex.admin.suite.tests {
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.flexunit.Assert;
import org.flexunit.async.Async;

public class TestCaseBasic {

        public var timer:Timer;

        public function TestCaseBasic() {

        }

        [Test(description="pierwszy test")]
        public function testMethod():void {
            var x:int = 5 + 3;
            Assert.assertEquals(8, x );
        }

        [Test(async, description="Async Example")]
        public function testTimerLongWay():void {
            var asyncHandler:Function = Async.asyncHandler( this, handleTimerComplete, 500, null, handleTimeout );
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, asyncHandler, false, 0, true );
            timer.start();
        }

        protected function handleTimerComplete( event:TimerEvent, passThroughData:Object ):void {
           //TODO wypelnic
        }

        private function handleTimeout( passThroughData:Object ):void {
            Assert.fail( "Timeout reached before event");
        }

        [Before]
        public function setUp():void {
            timer = new Timer( 100, 1 );
        }

        [After]
        public function tearDown():void {
            if( timer ) {
                timer.stop();
            }

            timer = null;
        }
    }
}