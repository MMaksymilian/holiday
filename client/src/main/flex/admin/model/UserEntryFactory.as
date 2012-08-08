/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 02.08.12
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.model {

import mx.collections.ArrayCollection;
import mx.controls.Alert;

public class UserEntryFactory {
    public var year:int;
    public var month:int;
    
    private var dtoList:ArrayCollection = new ArrayCollection();
    
    public function UserEntryFactory() {
    }

    public function flush(): void {
        dtoList.removeAll();
    }

    public function prepare(gDate:Date):void {
        year = gDate.getFullYear();
        month = gDate.getMonth()-1;
    }

    public function put(dto: HolidayExtDTO): void {
        dtoList.addItem(dto);
    }
    
    public function assemble(): UserEntry {
        var entry:UserEntry;
        if(dtoList.length==0){
            entry = new UserEntry("","",0,0);
        } else {
            var firstDayOfTheMonth:Date = new Date(year, month-1, 1);
            var lastDayOfTheMonth:Date = new Date(year, month, 0);
            var dto:HolidayExtDTO = HolidayExtDTO(dtoList.getItemAt(0));
            
            entry = new UserEntry(dto.firstName+" "+dto.secondName, dto.login, month, year);

            var firstDay:int;
            var lastDay:int;
            var date:Date;
            for(var i:int =0; i<dtoList.length; i++){
                dto = dtoList[i];

                if(compareDates(dto.dateFrom, firstDayOfTheMonth) != 1){
                    firstDay = 1;    
                } else {
                    firstDay = dto.dateFrom.date;
                }

                if(compareDates(dto.dateTo, lastDayOfTheMonth) != -1){
                    lastDay = lastDayOfTheMonth.date;
                } else {
                    lastDay = dto.dateTo.date;
                }

                /*Alert.show("From: "+dto.dateFrom.toDateString()+" FOTM: "+firstDayOfTheMonth.toDateString()+" C:"+compareDates(dto.dateFrom, firstDayOfTheMonth)
                           +"\nTo: "+dto.dateTo.toDateString()+" LOTM: "+lastDayOfTheMonth.toDateString()+" C:"+compareDates(dto.dateTo, lastDayOfTheMonth));*/
                entry.setHoliday(firstDay, lastDay, translateStatus(dto.status));
            }                                                            
        }

        return entry;
    }
    
    public static function compareDates(dateA:Date, dateB:Date):int {
        var result:int = 0;
        if(dateA.date > dateB.date){
            result = 1;
        } else if(dateA.date < dateB.date){
            result = -1;
        }

        if(dateA.month > dateB.month){
            result = 1;
        } else if(dateA.month < dateB.month){
            result = -1;
        }

        if(dateA.fullYear > dateB.fullYear){
            result = 1;
        } else if(dateA.fullYear < dateB.fullYear){
            result = -1;
        }
        return result;
    }

    public static function translateStatus(statusString:String):int {
        var status:int = 0;
        if(statusString=="APPLIED"){
            status = 0;
        } else if(statusString=="APPROVED"){
            status = 1;
        } else if(statusString=="REJECTED"){
            status = 2;
        }
        return status;
    }
}
}
