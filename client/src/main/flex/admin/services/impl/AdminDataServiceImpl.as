/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 31.07.12
 * Time: 10:53
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.services.impl {
import flex.admin.services.AdminDataService;
import flex.service.BaseService;

import mx.rpc.AsyncToken;
import mx.rpc.Responder;

public class AdminDataServiceImpl extends BaseService implements AdminDataService{
    public function AdminDataServiceImpl() {
        super("adminDataService");
    }

    public function getUserNames(year:int, month:int, handler:Function = null) {
        var rpcCall:AsyncToken = remoteService.getUserNames(year,  month);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }

    public function getUserEntry(login:String, year:int, month:int, handler:Function = null) {
        var rpcCall:AsyncToken = remoteService.getUserNames(login, year,  month);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }

    public function getEntries(year:int, month:int, handler:Function = null) {
        var rpcCall:AsyncToken = remoteService.getEntries(year,  month);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }
}
}
