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
import flex.data.Holiday;
import flex.data.ServiceUser;

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
        if(login=="kowalski"){
            entry = new UserEntry("Kowalski Jurek", "kowalski", month, year);
            if(year==2012 && month==8){
                entry.setHoliday(8, 24, 1);
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

    public function getEntries(year:int, month:int, handler:Function = null):void {
        var collection:ArrayCollection = new ArrayCollection();

        var firstEntry:UserEntry;
        var secondEntry:UserEntry;
        if(year==2012 && month==8){
            firstEntry = new UserEntry("Kowalski Jurek", "kowalski", month, year);
            secondEntry = new UserEntry("Radosław Wojak", "rwoj", month, year);

            firstEntry.setHoliday(8, 24, 1);

            secondEntry.setHoliday(4, 9, 2);
            secondEntry.setHoliday(15, 17, 1);

            collection.source.push(firstEntry);
            collection.source.push(secondEntry);
        } else if(year==2012 && month==7){
            firstEntry = new UserEntry("Olgierd Zuch", "ozuc", month, year);
            secondEntry = new UserEntry("Radosław Wojak", "rwoj", month, year);

            firstEntry.setHoliday(4, 9, 2);
            firstEntry.setHoliday(15, 17, 1);

            secondEntry.setHoliday(4, 9, 0);
            secondEntry.setHoliday(16, 17, 1);

            collection.addItem(firstEntry);
            collection.addItem(secondEntry);
        }

        Alert.show("Mocked");
    }

    public function switchStatus(login:String, startingDate:Date, status:int, handler:Function):void {
    }

    public function fetchHoliday(login:String, date:Date, handler:Function):void {
    }

    public function sendDecision(dtoId:Number, decisionStatus:int, cause:String, handler:Function):void {
    }

    public function createNewUser(serviceUser:ServiceUser, handler:Function, errHandler:Function = null) {
    }

    public function findDataForChosenUser(login:String, handler:Function = null, errHandler:Function = null):void {
    }

    public function acceptHoliday(holiday:Holiday, handler:Function = null, errHandler:Function = null):void {
    }

    public function rejectHoliday(holiday:Holiday, handler:Function = null, errHandler:Function = null):void {
    }
}
}
