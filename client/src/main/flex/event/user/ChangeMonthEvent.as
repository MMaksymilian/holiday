package flex.event.user {
import flash.events.Event;

public class ChangeMonthEvent extends Event {

    public var firstDate:Date;
    public var secondDate:Date;
    public static var CHANGED_MONTH:String="changedMonthEvent";

    public function ChangeMonthEvent(type:String, dateFrom:Date, dateTo:Date) {
        super(type);
        firstDate = dateFrom;
        secondDate = dateTo;
    }
}
}