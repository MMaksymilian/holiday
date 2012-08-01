package flex.event.admin {
import flash.events.Event;

import flex.data.Holiday;

import mx.controls.Alert;

public class AcceptHolidayEvent extends Event {
    public var holiday:Holiday;
    public static var acceptHolidayEvent:String = "confirmHolidayStatus";

    public function AcceptHolidayEvent (type:String, startingHoliday:Holiday) {
        super(type);
        Alert.show('init');
        Alert.show(startingHoliday.id.toString());
        holiday = startingHoliday;
    }
}
}