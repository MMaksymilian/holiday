package test.primaris.service.impl;

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

import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.Date;
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
public class HolidayServiceImpl extends FlexService implements HolidayService {

    @Autowired
    HolidayDAO holidayDAO;

    @Autowired
    ServiceUserDAO serviceUserDAO;

    @Override
    public HolidayDTO getHolidayById(Long id) {
        Holiday holiday = holidayDAO.getById(id);
        return this.rewriteToDTO(holiday);
    }

    @Override
    @PreAuthorize("hasRole('USER')")
    public List<HolidayDTO> findHolidayForCurrentUserAndMonth(Date date) {
        /*dane uwierzytelniające użytkownika*/
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userLogin = auth.getName();
        ServiceUser user = serviceUserDAO.getByLogin(userLogin);
        /*data od, data do*/
        DateTime dateTimeBefore = new DateTime(date);
        DateTime dateTimeAfter = dateTimeBefore.plusMonths(1);
        List<Holiday> holidayList = holidayDAO.findHolidayForUserAndBetweenDates(dateTimeBefore, dateTimeAfter, user);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();

        for(Holiday holiday : holidayList) {
            holidayDTOs.add(rewriteToDTO(holiday));
        }
        return holidayDTOs;
    }

    @Override
    @PreAuthorize("hasRole('USER')")
    public List<HolidayDTO> findHolidayForCurrentUserDatesBetween(Date dateFrom, Date dateTo) {
        /*dane uwierzytelniające użytkownika*/
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userLogin = auth.getName();
        ServiceUser user = serviceUserDAO.getByLogin(userLogin);
        /*data od, data do*/
        DateTime dateTimeBefore = new DateTime(dateFrom);
        DateTime dateTimeAfter = new DateTime(dateTo);
        List<Holiday> holidayList = holidayDAO.findHolidayForUserAndBetweenDates(dateTimeBefore, dateTimeAfter, user);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();
        for(Holiday holiday : holidayList) {
            holidayDTOs.add(rewriteToDTO(holiday));
        }
        return holidayDTOs;
    }

    @Override
    @PreAuthorize("hasRole('CHIEF')")
    public String acceptHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.APPROVED);
        holidayDAO.updateHolidayStatus(holiday);
        /*dodane bo metody nie chciały wywoływać handler'ów przy typie metody 'void'*/
        return "success";
    }

    @Override
    @PreAuthorize("hasRole('CHIEF')")
    public String rejectHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.REJECTED);
        holidayDAO.updateHolidayStatus(holiday);
        /*dodane bo metody nie chciały wywoływać handler'ów przy typie metody 'void'*/
        return "success";
    }

    @Override
    @PreAuthorize("hasRole('USER')")
    public String requestHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.APPLIED);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userLogin = auth.getName();
        ServiceUser user = serviceUserDAO.getByLogin(userLogin);
        holiday.setServiceUser(user);
        holidayDAO.requestHoliday(holiday);
        /*dodane bo metody nie chciały wywoływać handler'ów przy typie metody 'void'*/
        return "success";
    }

    @Override
    @PreAuthorize("hasRole('CHIEF')")
    public List<HolidayDTO> findDataForChosenUser(String login) {
        ServiceUser serviceUser = serviceUserDAO.getByLogin(login);
        List<Holiday> holidays = holidayDAO.findHolidayWithStatus(serviceUser, Holiday.HolidayStatus.APPLIED);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();
        for (Holiday holiday : holidays) {
            holidayDTOs.add(rewriteToDTO(holiday));
        }
        return holidayDTOs;
    }
}
