package test.primaris.dao;

import com.google.common.collect.Multimap;
import org.joda.time.DateTime;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:41
 * To change this template use File | Settings | File Templates.
 */
public interface HolidayDAO {
    Holiday getById(Long id);
    List<Holiday> findHolidayForUser(ServiceUser serviceUser);
    List<Holiday> findHolidayWithStatus(ServiceUser serviceUser, Holiday.HolidayStatus status);
    Long requestHoliday(Holiday holiday);
    List<Holiday> findHolidayForUserAndBetweenDates(DateTime dateTimeBefore, DateTime dateTimeAfter, ServiceUser user);
    List<Holiday> findHolidaysInRange(DateTime beginningDate, DateTime endingDate);
    List<Holiday> findHolidaysContainingRange(DateTime beginningDate, DateTime endingDate);
    List<Holiday> findHolidaysStartingInRange(DateTime beginningDate, DateTime endingDate);
    List<Holiday> findHolidaysEndingInRange(DateTime beginningDate, DateTime endingDate);
    public Holiday getHolidayForDate(DateTime date, ServiceUser user);
    void updateHolidayStatus(Holiday holidayDTO);
}
