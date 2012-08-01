package flex.event.admin {
import flash.events.Event;

import flex.data.Holiday;

public class RejectHolidayEvent extends Event {

    public var holiday:Holiday;
    public static var rejectHolidayEvent = "rejectHolidayEvent";

        public function RejectHolidayEvent(type:String,  startingHoliday:Holiday) {
            super(type);
            holiday = startingHoliday;
    }
    }
}