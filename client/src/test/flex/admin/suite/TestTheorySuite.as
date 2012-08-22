package flex.admin.suite {
import flex.admin.suite.tests.theory.object.MonthLength;
import flex.admin.suite.tests.theory.object.Weekends;

import mx.collections.ArrayList;

import org.flexunit.asserts.assertEquals;
import org.flexunit.experimental.theories.Theories;

    [RunWith("org.flexunit.experimental.theories.Theories")]
    public class TestTheorySuite {

        public function TestTheorySuite() {

        }

        private var theory:Theories;

        [DataPoints]
        [ArrayElementType("flex.admin.suite.tests.theory.object.MonthLength")]
        public static var monthLength:Array = [new MonthLength(new Date(2012, 8, 8), 30),
                                                        new MonthLength(new Date(2012, 11, 29), 31),
                                                        new MonthLength(new Date(2012, 2, 31), 31),
                                                        new MonthLength(new Date(2012, 0, 31), 31),
                                                        new MonthLength(new Date(2012, 1, 29), 29)];

        [DataPoints]
        [ArrayElementType("flex.admin.suite.tests.theory.object.Weekends")]
        public static var days:Array = [new Weekends(new Date(2012, 6, 20), [0, 6, 7, 13, 14, 20, 21, 27, 28]),
                                        new Weekends(new Date(2012,1, 2), [1, 2, 8, 9, 15, 16, 22, 23])];


        [Theory]
        public function daysInCurrentMonthTest(data:MonthLength):void {
            var monthLength:int = daysInCurrentMonth(data.currentDate);
            /*logowanie nie działa*/
            assertEquals(monthLength, data.days);
        }

        [Theory]
        public function getWeekendIndicesForMonthTest(data:Weekends):void {
            var weekends:ArrayList = getWeekendIndicesForMonth(data.someDate);
            assertEquals(data.weekendIndices.toString(), weekends.toString());
        }

        private function daysInCurrentMonth(date:Date):int {
            var MS_PER_DAY:uint = 1000 * 60 * 60 * 24;
            var currentDate:Date = date;
            var startDate:Date = new Date(currentDate.getFullYear(), currentDate.getMonth());
            var year:Number = startDate.getFullYear();
            var month:Number = (startDate.getMonth() + 1) % 13;
            if (month == 0) {
                month = 1;
                year += 1;
            }
            var endDate:Date = new Date(year,  month);
            var tempDate:Date = new Date(endDate.getTime() - startDate.getTime());
            var difference:int = Math.round(tempDate.time / MS_PER_DAY);
            return difference;
        }

        public function getWeekendIndicesForMonth(date:Date):ArrayList {
            var weekendsArray:ArrayList = new ArrayList();
            var monthLength:int =  daysInCurrentMonth(date);
            var MS_PER_DAY:uint = 1000 * 60 * 60 * 24;
            var firstOfMonth:Date = new Date(date.getFullYear(), date.getMonth());
            var firstOfMonthMs:int = firstOfMonth.getTime();
            for(var day:int=0;day < monthLength; day++) {
                var anotherDay:Date = new Date(firstOfMonthMs + (day - 1)*MS_PER_DAY);
                if (anotherDay.getDay() == 0 || anotherDay.getDay() == 6) {
                    weekendsArray.addItem(day);
                }
            }
            return weekendsArray;
        }
    }
}