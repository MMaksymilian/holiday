package flex.user.event {
import flash.events.Event;

import flex.common.data.Holiday;

public class HolidaySendRequestEvent extends Event {

    public var holidayData:Holiday;
    public static var SEND_HOLIDAY_REQUEST : String = "holidaySendRequestEvent";

    public function HolidaySendRequestEvent(type:String,data:Holiday) {
        super(type);
        holidayData = data;
    }
}
}