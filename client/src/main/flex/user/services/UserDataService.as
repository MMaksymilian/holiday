package flex.user.services {
import flex.common.data.Holiday;
import flex.common.service.BaseService;

public interface UserDataService {
    function findHolidayForCurrentUserAndMonth(date:Date, handler:Function, errHandler:Function = null):void;
    function findHolidayForCurrentUserDatesBetween(dateFrom:Date, dateTo:Date, handler:Function, errHandler:Function = null):void;
    function requestHoliday(holiday:Holiday, handler:Function = null, errHandler:Function = null):void;
    function getAllHolidaysMap(handler:Function,  errHandler:Function = null):void;
}
}