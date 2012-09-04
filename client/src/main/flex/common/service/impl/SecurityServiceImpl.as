package flex.common.service.impl {
import flex.common.data.ServiceUser;
import flex.common.service.BaseService;
import flex.common.service.SecurityService;

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