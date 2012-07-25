/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 25.07.12
 * Time: 13:12
 * To change this template use File | Settings | File Templates.
 */
package flex.data {
public class LoginData {
    private var login:String;
    private var password:String;

    public function LoginData() {

    }

    public function setLogin(login:String) {
        this.login = login;
    }

    public function setPassword(password:String) {
        this.password = password;
    }

    public function getLogin():String {
        return login;
    }

    public function getPassword():String {
        return password;
    }
}
}
