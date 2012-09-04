package flex.user.services.impl {
import flex.common.data.Holiday;
import flex.common.service.BaseService;
import flex.user.services.UserDataService;

import mx.rpc.AsyncToken;
import mx.rpc.Responder;

public class UserDataServiceImpl extends BaseService implements UserDataService {

    public function UserDataServiceImpl() {
        super("userDataService");
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

    public function getAllHolidaysMap(handler:Function, errHandler:Function = null):void{
        var rpcCall:AsyncToken;
        if(errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.getAllHolidaysMap();
        rpcCall.addResponder(new Responder(handler,  errHandler));
    }
}
}