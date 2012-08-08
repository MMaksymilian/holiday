package test.primaris.service.util;

import flex.messaging.util.StringUtils;
import org.joda.time.DateTime;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;
import test.primaris.entity.dto.HolidayExtDTO;
import test.primaris.entity.dto.ServiceUserDTO;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 31.07.12
 * Time: 09:54
 * To change this template use File | Settings | File Templates.
 */
public abstract class FlexServiceUtil {

    public static Holiday rewriteToEntity(HolidayDTO holidayDTO) {
        Holiday holiday = new Holiday();
        if (!StringUtils.isEmpty(holidayDTO.getStatus())) {
            holiday.setStatus(Holiday.HolidayStatus.valueOf(holidayDTO.getStatus()));
        }
        holiday.setCause(holidayDTO.getCause());
        holiday.setDateFrom(new DateTime(holidayDTO.getDateFrom()));
        holiday.setDateTo(new DateTime(holidayDTO.getDateTo()));
        if (holidayDTO.getId() != null) {
            holiday.setId(holidayDTO.getId().longValue());
        }
        /*TODO wymyśleć co zrobić z tym*/
//        holiday.setServiceUser();
        return holiday;
    }

    public static ServiceUser rewriteToEntity(ServiceUserDTO serviceUserDTO) {
        ServiceUser serviceUser = new ServiceUser();
        serviceUser.setFirstName(serviceUserDTO.getFirstName());
        serviceUser.setLastName(serviceUserDTO.getLastName());
        serviceUser.setLogin(serviceUserDTO.getLogin());
        serviceUser.setRole(serviceUserDTO.getRole());
        serviceUser.setPassword(serviceUserDTO.getPassword());
        return serviceUser;
    }

    public static HolidayDTO rewriteToDTO(Holiday holiday) {
        HolidayDTO holidayDTO = new HolidayDTO();
        holidayDTO.setCause(holiday.getCause());
        holidayDTO.setDateFrom(holiday.getDateFrom().toDate());
        holidayDTO.setDateTo(holiday.getDateTo().toDate());
        holidayDTO.setStatus(holiday.getStatus().toString());
        holidayDTO.setId(holiday.getId().intValue());
        return holidayDTO;
    }

    public static ServiceUserDTO rewriteToDTO(ServiceUser serviceUser){
        ServiceUserDTO serviceUserDTO = new ServiceUserDTO();
        serviceUserDTO.setId(serviceUser.getId().intValue());
        serviceUserDTO.setFirstName(serviceUser.getFirstName());
        serviceUserDTO.setLastName(serviceUser.getLastName());
        serviceUserDTO.setLogin(serviceUser.getLogin());
        return  serviceUserDTO;
    }

    public static HolidayExtDTO rewriteToExtDTO(ServiceUser user, Holiday holiday){
        HolidayExtDTO dto = new HolidayExtDTO();
        dto.setCause(holiday.getCause());
        dto.setLogin(user.getLogin());
        dto.setDateFrom(holiday.getDateFrom().toDate());
        dto.setDateTo(holiday.getDateTo().toDate());
        dto.setStatus(holiday.getStatus().toString());
        if (holiday.getId() != null) {
            dto.setId(holiday.getId().intValue());
        }

        dto.setFirstName(user.getFirstName());
        dto.setSecondName(user.getLastName());
        return dto;

    }
}
