/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 26.07.12
 * Time: 12:34
 * To change this template use File | Settings | File Templates.
 */
package flex.common {
import mx.rpc.remoting.RemoteObject;
import events.RemoteExceptionEvent;
import events.AuthenticationFailureEvent;
import mx.core.Application;
import mx.rpc.events.FaultEvent;

public class RemoteService {
    private static var BAD_CREDENTIALS:String = "org.Springframework.security.BadCredentialsException : Bad credentials";
    protected var remoteObject:RemoteObject;
    public function RemoteService(id:String, destination:String) {
        this.remoteObject = new RemoteObject(id);
        this.remoteObject.destination = destination;
        this.remoteObject.addEventListener(FaultEvent.FAULT,onRemoteException);
    }
    public function onRemoteException(event:FaultEvent):void {
        if (event.fault.faultString == BAD_CREDENTIALS) {
            Application.application.dispatchEvent(new AuthenticationFailureEvent(
                    AuthenticationFailureEvent.AUTHENTICATION_FAILURE,"problem while authenticating"));
        } else {
            Application.application.dispatchEvent(new RemoteExceptionEvent(
                    RemoteExceptionEvent.REMOTE_EXCEPTION,
                    "unknown problem occurred during a remote call : " + event.fault.message));
        }
    }
}
}