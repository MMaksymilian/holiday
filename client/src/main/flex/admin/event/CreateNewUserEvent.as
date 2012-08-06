package flex.admin.event {
import flash.events.Event;

import flex.data.ServiceUser;

public class CreateNewUserEvent extends Event {

    public var newUser:ServiceUser;
    public static var CREATE_NEW_USER:String = "createNewUser";

    public function CreateNewUserEvent(type:String, serviceUser:ServiceUser) {
        super(type, true);
        newUser = serviceUser;
    }
}
}