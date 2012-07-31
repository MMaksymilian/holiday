package flex.service {

import flex.data.Holiday;

import mx.controls.Alert;
import mx.rpc.AsyncToken;
import mx.rpc.Responder;

public class HolidayFlexService extends BaseService {

    public function HolidayFlexService() {
        super("holidayServiceImpl");
    }


    public function findHolidayForCurrentUserAndMonth(date:Date, handler:Function, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.findHolidayForCurrentUserAndMonth(date);
        rpcCall.addResponder(new Responder(handler, errHandler));
    }

    public function findHolidayForCurrentUserDatesBetween(dateFrom:Date, dateTo:Date, handler:Function, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        if(errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.findHolidayForCurrentUserDatesBetween(dateFrom, dateTo);
        rpcCall.addResponder(new Responder(handler,  errHandler));
    }

    public function requestHoliday(holiday:Holiday, handler:Function = null, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.requestHoliday(holiday);
        rpcCall.addResponder(new Responder(handler,  errHandler));
    }

    public function findDataForChosenUser(login:String,  handler:Function = null, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.findDataForChosenUser(login);
        rpcCall.addResponder(new Responder(handler,  errHandler));
    }
}
}
