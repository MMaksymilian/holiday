package test.primaris.service;

import test.primaris.entity.dto.HolidayDTO;
import test.primaris.entity.dto.ServiceUserDTO;

import java.util.List;

public interface AdminDataService {

    void createNewUser(ServiceUserDTO serviceUserDTO);
    String acceptHoliday(HolidayDTO holidayDTO);
    String rejectHoliday(HolidayDTO holidayDTO);
    List<HolidayDTO> findDataForChosenUser(String login);
}
