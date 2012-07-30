package test.primaris.service.impl;

import net.sf.cglib.core.ReflectUtils;
import org.hibernate.annotations.common.reflection.ReflectionUtil;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.primaris.dao.HolidayDAO;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;
import test.primaris.service.HolidayService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:40
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional
@RemotingDestination
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    HolidayDAO holidayDAO;

    @Autowired
    ServiceUserDAO serviceUserDAO;

//    @PreAuthorize()
    @Override
    public HolidayDTO getHolidayById(Long id) {
        Holiday holiday = holidayDAO.getById(id);
        HolidayDTO holidayDTO = new HolidayDTO();
        holidayDTO.setCause(holiday.getCause());
        holidayDTO.setDateFrom(holiday.getDateFrom().toDate());
        holidayDTO.setDateTo(holiday.getDateTo().toDate());
        holidayDTO.setStatus(holiday.getStatus().toString());
        holidayDTO.setId(holiday.getId().intValue());
        return holidayDTO;
    }

//    @PreAuthorize()
    @Override
    public List<HolidayDTO> findHolidayForCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userLogin = auth.getName();
        ServiceUser user = serviceUserDAO.getByLogin(userLogin);
        List<Holiday> holidayList = holidayDAO.findHolidayForUser(user);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();
        for(Holiday holiday : holidayList) {
            HolidayDTO holidayDTO = new HolidayDTO();
            holidayDTO.setCause(holiday.getCause());
            holidayDTO.setDateFrom(holiday.getDateFrom().toDate());
            holidayDTO.setDateTo(holiday.getDateTo().toDate());
            holidayDTO.setId(holiday.getId().intValue());
            holidayDTO.setStatus(holiday.getStatus().toString());
            holidayDTOs.add(holidayDTO);
        }
        return holidayDTOs;
    }

//    @PreAuthorize()
    @Override
    public Long requestHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = new Holiday();
        holiday.setStatus(Holiday.HolidayStatus.valueOf(holidayDTO.getStatus()));
        holiday.setCause(holidayDTO.getCause());
        holiday.setDateFrom(new DateTime(holidayDTO.getDateFrom()));
        holiday.setDateTo(new DateTime(holidayDTO.getDateTo()));

        holiday.setStatus(Holiday.HolidayStatus.APPLIED);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userLogin = auth.getName();
        ServiceUser user = serviceUserDAO.getByLogin(userLogin);
        holiday.setServiceUser(user);
        return holidayDAO.requestHoliday(holiday);
    }
}
