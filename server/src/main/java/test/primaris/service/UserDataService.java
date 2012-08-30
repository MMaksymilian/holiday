package test.primaris.service;

import test.primaris.entity.dto.HolidayDTO;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 06.08.12
 * Time: 09:34
 * To change this template use File | Settings | File Templates.
 */
public interface UserDataService {

    HolidayDTO getHolidayById(Long id);
    List<HolidayDTO> findHolidayForCurrentUserAndMonth(Date date);
    List<HolidayDTO> findHolidayForCurrentUserDatesBetween(Date dateFrom, Date dateTo);
    String requestHoliday(HolidayDTO holidayDTO);
    public Map<String, Collection<HolidayDTO>> getAllHolidaysMap();
}
