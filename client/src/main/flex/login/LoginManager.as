/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 26.07.12
 * Time: 11:19
 * To change this template use File | Settings | File Templates.
 */
package flex.login {
import mx.rpc.remoting.RemoteObject;

public class LoginManager {

    var remoteService:RemoteObject;

    public function LoginManager() {
        remoteService = new RemoteObject();

        }

    public function attemptLogin(login, password): Boolean {
        var loginSuccesful: Boolean = false;

        return loginSuccesful;
        }
    }
}
