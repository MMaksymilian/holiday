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

    public function readUserData(holidayData:ArrayCollection):void {
        for (var i:int = 0; i < holidayData.length; i++) {
            var MS_PER_DAY:uint = 1000 * 60 * 60 * 24;
            var beginingDate:Date = holidayData[i].dateFrom;
            var tempDate:Date = new Date(holidayData[i].dateTo - beginingDate.getTime());
            if (holidayData[i].dateFrom.getMonth() < month) {
                var firstOfMonth:Date = new Date(year,  month,  1);
                beginingDate = firstOfMonth;
                tempDate = new Date(holidayData[i].dateTo - firstOfMonth.getTime());
            }
            var difference:int = Math.round(tempDate.time / MS_PER_DAY);
            var beginningIndex:int = beginingDate.getDate() - 1;
            for(var iDate:int = 0; (iDate <= difference) && ((beginningIndex + iDate) < dataCollection.length) ; iDate++) {
                var status:String = holidayData[i].status;
                if (status == "APPROVED") {
                    dataCollection[beginningIndex + iDate] = STATUS_ACCEPTED;
                } else if (status == "APPLIED") {
                    dataCollection[beginningIndex + iDate] = STATUS_WAITING;
                } else if (status == "REJECTED") {
                    dataCollection[beginningIndex + iDate] = STATUS_REJECTED;
                }
            }
//            Alert.show( (holidayData[i].dateFrom.getDate() - 1).toString() );
//            Alert.show(dataCollection + "");
        }
    }

    public function setHoliday(from:int, to:int, status:int = 0):void {
        for(var i:int=from; i<=to; i++){
            dataCollection[i-1] = status;
        }
    }
}
}
