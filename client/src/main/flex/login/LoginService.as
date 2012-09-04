/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 27.07.12
 * Time: 12:13
 * To change this template use File | Settings | File Templates.
 */
package flex.login {
import flex.common.service.BaseService;

import mx.controls.Alert;

import mx.rpc.AsyncToken;
import mx.rpc.Responder;
import mx.rpc.events.ResultEvent;

public class LoginService extends BaseService {
    public function LoginService() {
        super("securityService");
    }

    public function isUserInRole(role:String = "USER", handler:Function = null):void {
        var rpcCall:AsyncToken = remoteService.isUserInRole(role);
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }

    public function getHighestRole(handler: Function):void {
        var rpcCall:AsyncToken = remoteService.getHighestUserRole();
        rpcCall.addResponder(new Responder(handler, handler_generalFault));
    }
}
}
