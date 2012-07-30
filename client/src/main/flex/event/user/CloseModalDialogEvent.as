package flex.event.user {
import flash.events.Event;

public class CloseModalDialogEvent extends Event {

    public static var SEND_CLOSE_MODAL_DIALOG : String = "closeModalDialog";

    public function CloseModalDialogEvent(type:String) {
        super(type);
    }
}
}