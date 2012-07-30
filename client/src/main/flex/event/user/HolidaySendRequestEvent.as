package flex.event.user {
import flash.events.Event;

import flex.data.Holiday;

public class HolidaySendRequestEvent extends Event {

    public var holidayData:Holiday;
    public static var SEND_HOLIDAY_REQUEST : String = "holidaySendRequestEvent";

    public function HolidaySendRequestEvent(type:String,data:Holiday) {
        super(type);
        holidayData = data;
    }
}
}