package test.primaris.service.impl;

import flex.messaging.util.StringUtils;
import org.joda.time.DateTime;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;
import test.primaris.entity.dto.ServiceUserDTO;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 31.07.12
 * Time: 09:54
 * To change this template use File | Settings | File Templates.
 */
public class FlexService {

    public Holiday rewriteToEntity(HolidayDTO holidayDTO) {
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

    public static HolidayDTO rewriteToDTO(Holiday holiday) {
        HolidayDTO holidayDTO = new HolidayDTO();
        holidayDTO.setCause(holiday.getCause());
        /*nie mogą być null*/
        holidayDTO.setDateFrom(holiday.getDateFrom().toDate());
        holidayDTO.setDateTo(holiday.getDateTo().toDate());
        holidayDTO.setStatus(holiday.getStatus().toString());
        /*nie mogą być null*/
        if (holiday.getId() != null) {
            holidayDTO.setId(holiday.getId().intValue());
        }
        return holidayDTO;
    }

    public static ServiceUserDTO getDTO(ServiceUser serviceUser){
        ServiceUserDTO serviceUserDTO = new ServiceUserDTO();
        serviceUserDTO.setId(serviceUser.getId().intValue());
        serviceUserDTO.setFirstName(serviceUser.getFirstName());
        serviceUserDTO.setLastName(serviceUser.getLastName());
        serviceUserDTO.setLogin(serviceUser.getLogin());

        return  serviceUserDTO;
    }
}
