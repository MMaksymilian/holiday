package flex.service {

import mx.controls.Alert;
import mx.messaging.messages.ErrorMessage;
import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.remoting.mxml.RemoteObject;

public class ServiceUserFlexService extends BaseService {

    public function ServiceUserFlexService() {
        super("serviceUserServiceImpl");
    }

}
}