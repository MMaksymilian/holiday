/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 31.07.12
 * Time: 10:53
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.services.impl {
import flex.admin.services.AdminDataService;
import flex.data.ServiceUser;
import flex.service.BaseService;

import mx.collections.ArrayCollection;

import mx.rpc.AsyncToken;
import mx.rpc.Responder;

public class AdminDataServiceImpl extends BaseService implements AdminDataService{
    public function AdminDataServiceImpl() {
        super("adminDataService");
    }

    public function getUserNames(year:int, month:int, handler:Function = null):void {
        var rpcCall:AsyncToken = remoteService.getUserNames(year,  month);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }

    public function getUserEntry(login:String, year:int, month:int, handler:Function = null):void {
        var rpcCall:AsyncToken = remoteService.getUserNames(login, year,  month);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }

    public function getEntries(year:int, month:int, handler:Function = null):ArrayCollection {
        var rpcCall:AsyncToken = remoteService.getEntries(year,  month);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
        return new ArrayCollection();
    }

    public function switchStatus(login:String, startingDate:Date, status:int, handler:Function):void {

    }

    public function fetchHoliday(login:String, date:Date) {
    }

    public function createNewUser(serviceUser:ServiceUser,  handler:Function, errHandler:Function = null) {
        var rpcCall:AsyncToken;
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.createNewUser(serviceUser);
        rpcCall.addResponder(new Responder(handler, errHandler));
    }
}
}
