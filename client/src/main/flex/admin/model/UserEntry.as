/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 30.07.12
 * Time: 16:33
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.model {
import mx.collections.ArrayCollection;

public class UserEntry {
    public var name:String;
    public var login:String;
    public var dataCollection:ArrayCollection;

    public function UserEntry(gName:String, gLogin:String, month:int, year:int) {
        name = gName;
        login = gLogin;

        var date:Date = new Date(year, month+1, 0);
        var days:int = date.getDay();
    }


}
}
