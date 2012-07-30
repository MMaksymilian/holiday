/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 30.07.12
 * Time: 17:05
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.model {
public class DayDO {
    private var day:Date;
    private var status:int;

    public function DayDO(gDay:Date, gStatus:int = 0) {
        day = gDay;
        status = gStatus;
    }

    public function getDate():Date {
        return day;
    }

    public function switchStatus(nStatus:int){
        status = nStatus;
    }

    public function getStatus():int {
        return status;
    }
}
}
