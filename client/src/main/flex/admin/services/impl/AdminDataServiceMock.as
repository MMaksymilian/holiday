/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 31.07.12
 * Time: 10:36
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.services.impl {
import flex.admin.model.UserEntry;
import flex.admin.services.AdminDataService;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.rpc.events.ResultEvent;

public class AdminDataServiceMock implements AdminDataService {
    public function AdminDataServiceMock() {

    }

    public function getUserNames(year:int, month:int, handler:Function = null):void {
        var collection:ArrayCollection = new ArrayCollection();
        collection.addItem("ozuc");
        collection.addItem("rwoj");

        handler.apply(collection);
    }

    public function getUserEntry(login:String, year:int, month:int, handler:Function = null):void {
        var entry:UserEntry;
        if(login=="ozuc"){
            entry = new UserEntry("Olgierd Zuch", "ozuc", month, year);
            if(year==2012 && month==6){
                entry.setHoliday(1, 10);
                entry.setHoliday(15, 25, 1);
            } else if(year==2012 && month==7){
                entry.setHoliday(2, 5);
                entry.setHoliday(15, 25, 2);
            }
        } else if(login=="rwoj"){
            entry = new UserEntry("Radosław Wojak", "rwoj", month, year);
            if(year==2012 && month==6){
                entry.setHoliday(4, 9, 2);
                entry.setHoliday(15, 17, 1);
            } else if(year==2012 && month==7){
                entry.setHoliday(4, 9, 0);
                entry.setHoliday(16, 17, 1);
            }
        }

        handler.apply(entry);
    }

    public function getEntries(year:int, month:int, handler:Function = null):ArrayCollection {
        var collection:ArrayCollection = new ArrayCollection();

        if(year==2012 && month==6){
            var firstEntry:UserEntry = new UserEntry("Olgierd Zuch", "ozuc", month, year);
            var secondEntry:UserEntry = new UserEntry("Radosław Wojak", "rwoj", month, year);

            firstEntry.setHoliday(1, 10);
            firstEntry.setHoliday(15, 25, 1);

            secondEntry.setHoliday(4, 9, 2);
            secondEntry.setHoliday(15, 17, 1);

            collection.source.push(firstEntry);
            collection.source.push(secondEntry);
        } else if(year==2012 && month==7){
            var firstEntry:UserEntry = new UserEntry("Olgierd Zuch", "ozuc", month, year);
            var secondEntry:UserEntry = new UserEntry("Radosław Wojak", "rwoj", month, year);

            firstEntry.setHoliday(4, 9, 2);
            firstEntry.setHoliday(15, 17, 1);

            secondEntry.setHoliday(4, 9, 0);
            secondEntry.setHoliday(16, 17, 1);

            collection.addItem(firstEntry);
            collection.addItem(secondEntry);
        }

        Alert.show("Mocked");
        return collection;
    }
}
}
