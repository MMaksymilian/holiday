package test.primaris.service.impl;

import com.google.common.collect.*;
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
import test.primaris.security.TestAppUserDetails;
import test.primaris.service.EmailSender;
import test.primaris.service.UserDataService;
import test.primaris.service.util.FlexServiceUtil;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 06.08.12
 * Time: 09:35
 * To change this template use File | Settings | File Templates.
 */
@Service("userDataService")
@Transactional
@RemotingDestination
public class UserDataServiceImpl implements UserDataService {

    @Autowired
    HolidayDAO holidayDAO;

    @Autowired
    ServiceUserDAO serviceUserDAO;

    @Autowired
    private EmailSender emailSender;

    @Override
    public HolidayDTO getHolidayById(Long id) {
        Holiday holiday = holidayDAO.getById(id);
        return FlexServiceUtil.rewriteToDTO(holiday);
    }

    @Override
    public List<HolidayDTO> findHolidayForCurrentUserAndMonth(Date date) {
        /*dane uwierzytelniające użytkownika*/
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ServiceUser user = ((TestAppUserDetails)auth.getPrincipal()).getServiceUser();
        /*data od, data do*/
        DateTime dateTimeBefore = new DateTime(date);
        DateTime dateTimeAfter = dateTimeBefore.plusMonths(1);
        List<Holiday> holidayList = holidayDAO.findHolidayForUserAndBetweenDates(dateTimeBefore, dateTimeAfter, user);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();

        for(Holiday holiday : holidayList) {
            holidayDTOs.add(FlexServiceUtil.rewriteToDTO(holiday));
        }
        return holidayDTOs;
    }

    @Override
    public List<HolidayDTO> findHolidayForCurrentUserDatesBetween(Date dateFrom, Date dateTo) {
        /*dane uwierzytelniające użytkownika*/
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ServiceUser user = ((TestAppUserDetails)auth.getPrincipal()).getServiceUser();
        /*data od, data do*/
        DateTime dateTimeBefore = new DateTime(dateFrom);
        DateTime dateTimeAfter = new DateTime(dateTo);
        List<Holiday> holidayList = holidayDAO.findHolidayForUserAndBetweenDates(dateTimeBefore, dateTimeAfter, user);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();
        for(Holiday holiday : holidayList) {
            holidayDTOs.add(FlexServiceUtil.rewriteToDTO(holiday));
        }
        return holidayDTOs;
    }

    @Override
    public String requestHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = FlexServiceUtil.rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.APPLIED);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ServiceUser user = ((TestAppUserDetails)auth.getPrincipal()).getServiceUser();
        holiday.setServiceUser(user);
        if (!holidayDAO.findHolidayForUserAndBetweenDates(holiday.getDateFrom(), holiday.getDateTo(), user).isEmpty()) {
            return "failure";
        }
        holidayDAO.requestHoliday(holiday);

        /*Mozna by przeniesc role uzytkownikow do enuma*/
        List<ServiceUser> sendTo = serviceUserDAO.getUsersInRole("ROLE_CHIEF");
        emailSender.sendHolidayRequestNotification(holiday.getDateFrom(), holiday.getDateTo(),  user, sendTo);
        return "success";
    }

    @Override
    public Map<String, Collection<HolidayDTO>> getAllHolidaysMap() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Holiday> holidays = holidayDAO.findHolidayForUser(((TestAppUserDetails)principal).getServiceUser());
//        TreeMultimap<String, HolidayDTO> holidaysMultiMap = TreeMultimap.create();
        LinkedListMultimap<String, HolidayDTO> holidaysMultiMap = LinkedListMultimap.create();
        for(Holiday holiday : holidays) {
            for(int i = 0; i <= (holiday.getDateTo().monthOfYear().get() - holiday.getDateFrom().monthOfYear().get()) ; i++) {
                holidaysMultiMap.put(holiday.getDateFrom().plusMonths(i).toString("MM/yyyy"),  FlexServiceUtil.rewriteToDTO(holiday));
            }
        }
        return holidaysMultiMap.asMap();
    }
}
