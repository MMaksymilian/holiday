package flex.calc {
import mx.collections.ArrayList;

public class ClientCalc {
    public static function getWeekendIndicesForMonth(date:Date):ArrayList {
        var weekendsArray:ArrayList = new ArrayList();
        var monthLength:int = daysInCurrentMonth(date);
        var MS_PER_DAY:uint = 1000 * 60 * 60 * 24;
        var firstOfMonth:Date = new Date(date.getFullYear(), date.getMonth());
        var firstOfMonthMs:int = firstOfMonth.getTime();
        for (var day:int = 0; day < monthLength; day++) {
            var anotherDay:Date = new Date(firstOfMonthMs + (day - 1) * MS_PER_DAY);
            if (anotherDay.getDay() == 0 || anotherDay.getDay() == 6) {
                weekendsArray.addItem(day);
            }
        }
        return weekendsArray;
    }

    private static function daysInCurrentMonth(date:Date):int {
        var MS_PER_DAY:uint = 1000 * 60 * 60 * 24;
        var currentDate:Date = date;
        var startDate:Date = new Date(currentDate.getFullYear(), currentDate.getMonth());
        var year:Number = startDate.getFullYear();
        var month:Number = (startDate.getMonth() + 1) % 13;
        if (month == 0) {
            month = 1;
            year += 1;
        }
        var endDate:Date = new Date(year, month);
        var tempDate:Date = new Date(endDate.getTime() - startDate.getTime());
        var difference:int = Math.round(tempDate.time / MS_PER_DAY);
        return difference;
    }
}
}