package flex.common.service {
import flash.net.URLRequest;
import flash.net.navigateToURL;

import mx.controls.Alert;
import mx.messaging.messages.ErrorMessage;
import mx.rpc.events.FaultEvent;
import mx.rpc.remoting.RemoteObject;

public class BaseService {

        public var remoteService:RemoteObject;

        public function BaseService (serviceName :String = null) {
            remoteService = new RemoteObject(serviceName);
        }

        public function disconnect(): void {
            remoteService.disconnect();
        }

        protected function handler_generalFault(fault:FaultEvent):void {
            var er:ErrorMessage = (fault.message as ErrorMessage);

            try {
                if (er.hasOwnProperty("rootCause")) {
                    if (er.faultString.indexOf("org.springframework.security.access.AccessDeniedException") != - 1) {
                        navigateToURL(new URLRequest('login'),'_self')
                    }
                    Alert.show(er.faultString, "Błąd serwera ");
                } else {
                    Alert.show(er.faultString, "Błąd");
                }
            } catch (e:Error) {
                Alert.show(er.faultString, "Błąd klienta");
                Alert.show(er.faultDetail, "Błąd klienta");
            }
            disconnect();
        }
}
}