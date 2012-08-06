/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 02.08.12
 * Time: 11:18
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.model {
[RemoteClass(alias="test.primaris.entity.dto.HolidayExtDTO")]
public class HolidayExtDTO {

    public var id:Number;
    public var firstName:String;
    public var secondName:String;
    public var login:String;
    public var dateFrom:Date;
    public var dateTo:Date;
    public var cause:String;
    public var status:String;

    public function HolidayExtDTO(){
    }
}
}
