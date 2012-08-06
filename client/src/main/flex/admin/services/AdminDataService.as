/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 31.07.12
 * Time: 10:30
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.services {
import flex.admin.model.UserEntry;
import flex.data.Holiday;
import flex.data.ServiceUser;

import mx.collections.ArrayCollection;

public interface AdminDataService {
    function getEntries(year:int, month:int, handler:Function = null):void;
    function getUserNames(year:int, month:int, handler:Function = null):void;
    function getUserEntry(login:String,  year:int,  month:int, handler:Function = null):void;
    function fetchHoliday(login:String, date:Date, handler:Function):void;
    function sendDecision(dtoId:Number, decisionStatus:int, cause:String, handler:Function):void;
    function createNewUser(serviceUser:ServiceUser, handler:Function, errHandler:Function = null);
    function findDataForChosenUser(login:String,  handler:Function = null, errHandler:Function = null):void;
    function acceptHoliday(holiday:Holiday, handler:Function = null, errHandler:Function = null):void;
    function rejectHoliday(holiday:Holiday,handler:Function = null, errHandler:Function = null):void;
}
}
