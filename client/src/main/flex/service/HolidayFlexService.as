package flex.service {

import flex.data.Holiday;
import mx.controls.Alert;
import mx.messaging.messages.ErrorMessage;
import mx.rpc.AsyncToken;
import mx.rpc.Responder;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;
import mx.rpc.events.FaultEvent;

public class HolidayFlexService extends BaseService {


    public function HolidayFlexService() {
        super("holidayServiceImpl");
    }

    public function findHolidayForCurrentUser(handler:Function, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        remoteService.findHolidayForCurrentUser();
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        remoteService.addEventListener(ResultEvent.RESULT, handler);
//        rpcCall.addResponder(new Responder(handler, errHandler));
    }

    public function requestHoliday(holiday:Holiday, handler:Function = null, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        remoteService.requestHoliday(holiday);
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall.addResponder(new Responder(handler,  errHandler));
    }

}
}
