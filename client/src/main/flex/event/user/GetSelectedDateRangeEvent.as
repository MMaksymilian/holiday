package flex.event.user {
import flash.events.Event;

public class GetSelectedDateRangeEvent extends Event {

    public var dateFrom:Date;
    public var dateTo:Date;
    public static var SELECTED_DATE_RANGE:String="changedMonthEvent";

    public function GetSelectedDateRangeEvent(type:String, firstDate:Date, secondDate:Date) {
        super(type);
        dateFrom = firstDate;
        dateTo =  secondDate;
    }

}
}