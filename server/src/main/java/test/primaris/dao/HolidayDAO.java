package test.primaris.dao;

import org.joda.time.DateTime;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;

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
    void updateHolidayStatus(Holiday holidayDTO);
}
