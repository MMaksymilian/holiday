package test.primaris.service;

import test.primaris.entity.Holiday;
import test.primaris.entity.dto.HolidayDTO;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:40
 * To change this template use File | Settings | File Templates.
 */
public interface HolidayService {

    HolidayDTO getHolidayById(Long id);
    List<HolidayDTO> findHolidayForCurrentUserAndMonth(Date date);
    List<HolidayDTO> findHolidayForCurrentUserDatesBetween(Date dateFrom, Date dateTo);
    void requestHoliday(HolidayDTO holiday);
    List<HolidayDTO> findDataForChosenUser(String login);
}
