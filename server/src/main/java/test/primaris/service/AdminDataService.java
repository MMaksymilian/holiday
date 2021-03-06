package test.primaris.service;

import test.primaris.entity.dto.HolidayDTO;
import test.primaris.entity.dto.HolidayExtDTO;
import test.primaris.entity.dto.ServiceUserDTO;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface AdminDataService {
    void createNewUser(ServiceUserDTO serviceUserDTO);
    String acceptHoliday(HolidayDTO holidayDTO);
    String rejectHoliday(HolidayDTO holidayDTO);
    List<HolidayDTO> findDataForChosenUser(String login);
    public HolidayExtDTO fetchHoliday(String login, Date date);
    public List<HolidayExtDTO> getEntriesForMonth(int year, int month);
    public void sendDecision(int holidayId, int decision, String cause);
    public Collection<ServiceUserDTO> getAllWorkers();
    public Map<String, Collection<HolidayDTO>>  getHolidaysMap();
}
