package flex.service.impl {
import flex.data.ServiceUser;
import flex.service.BaseService;
import flex.service.SecurityService;

import mx.rpc.AsyncToken;
import mx.rpc.Responder;

public class SecurityServiceImpl extends BaseService implements SecurityService {

    public function SecurityServiceImpl() {
        super("securityService");
    }

    public function getCurrentUser(handler:Function, errHandler:Function = null):void {
        var rpcCall:AsyncToken;
        if (errHandler == null) {
            errHandler = handler_generalFault;
        }
        rpcCall = remoteService.getCurrentUser();
        rpcCall.addResponder(new Responder(handler, errHandler));
    }
}
}