package flex.service {
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
                    Alert.show(er.faultString, "Błąd serwera" + er.rootCause.header);
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