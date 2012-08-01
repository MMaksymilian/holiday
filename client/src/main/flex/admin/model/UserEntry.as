/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 30.07.12
 * Time: 16:33
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.model {
import mx.collections.ArrayCollection;
import mx.controls.Alert;

public class UserEntry {
    public const STATUS_NONE:int = -1;
    public const STATUS_WAITING:int = 0;
    public const STATUS_ACCEPTED:int = 1;
    public const STATUS_REJECTED:int = 2;

    public var name:String;
    public var login:String;
    public var dataCollection:ArrayCollection = new ArrayCollection();
    public var month:int;
    public var year:int;

    public function UserEntry(gName:String, gLogin:String, gMonth:int, gYear:int) {
        name = gName;
        login = gLogin;
        month = gMonth;
        year = gYear;

        var date:Date = new Date(year, month+1, 0);
        var days:int = date.getDate();

        for(var i:int=0; i<days; i++){
            dataCollection.addItem(-1);
        }
    }

    public function setHoliday(from:int, to:int, status:int = 0):void {
        for(var i:int=from; i<=to; i++){
            dataCollection[i-1] = status;
        }
    }
}
}
