package test.primaris.service.impl;


import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import test.primaris.dao.HolidayDAO;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;
import test.primaris.entity.dto.HolidayExtDTO;
import test.primaris.entity.dto.ServiceUserDTO;
import test.primaris.security.TestAppUserDetails;
import test.primaris.service.AdminDataService;
import test.primaris.service.EmailSender;
import test.primaris.service.util.FlexServiceUtil;

import java.util.*;

@Service("adminDataService")
@RemotingDestination
public class AdminDataServiceImpl implements AdminDataService {
    private static Map<Integer, Holiday.HolidayStatus> holidayStatusMap = new HashMap<Integer, Holiday.HolidayStatus>();
    static {
        holidayStatusMap.put(0, Holiday.HolidayStatus.APPLIED);
        holidayStatusMap.put(1, Holiday.HolidayStatus.APPROVED);
        holidayStatusMap.put(2, Holiday.HolidayStatus.REJECTED);
    }
    
    @Autowired
    private HolidayDAO holidayDAO;

    @Autowired
    private ServiceUserDAO serviceUserDAO;

    @Autowired
    private EmailSender emailSender;
    
    public List<ServiceUserDTO> getUserNames(int year, int month) {
        List<ServiceUserDTO> userList = new ArrayList<ServiceUserDTO>();

        DateTime startingDate = new DateTime(year, month, 1, 0, 0);
        DateTime endingDate = new DateTime(year, month+1, 1, 0, 0);

        List<Holiday> inRange = holidayDAO.findHolidaysInRange(startingDate, endingDate);
        List<Holiday> outsideRange = holidayDAO.findHolidaysContainingRange(startingDate, endingDate);


        Set<String> loginSet = new HashSet<String>();
        String login;
        /*for(Holiday holiday: monthlyHolidayList){
            login = holiday.getServiceUser().getLogin();
            if(!loginSet.contains(login)){
                loginSet.add(login);
            }
        }
*/
        // Do FLEX'a trzeba wyslac DTO
        ServiceUser currentUser;
        for(String currentLogin: loginSet){
            currentUser = serviceUserDAO.getByLogin(currentLogin);
            userList.add(FlexServiceUtil.rewriteToDTO(currentUser));
        }

        return userList;
    }
    
    public List<HolidayExtDTO> getEntriesForMonth(int year, int month){
        DateTime startingDate = new DateTime(year, month, 1, 0, 0);
        DateTime endingDate = null;
        if(month==12){
            endingDate = new DateTime(year+1, 1, 1, 0, 0);
        } else {
            endingDate = new DateTime(year, month+1, 1, 0, 0);
        }

        List<Holiday> inRange = holidayDAO.findHolidaysInRange(startingDate, endingDate);
        List<Holiday> outsideRange = holidayDAO.findHolidaysContainingRange(startingDate, endingDate);
        List<Holiday> startingInRange = holidayDAO.findHolidaysStartingInRange(startingDate, endingDate);
        List<Holiday> endingInRange = holidayDAO.findHolidaysEndingInRange(startingDate, endingDate);

        List<Holiday> list = new ArrayList<Holiday>();
        list.addAll(inRange);
        list.addAll(outsideRange);
        list.addAll(startingInRange);
        list.addAll(endingInRange);

        List<HolidayExtDTO> dtoList = new ArrayList<HolidayExtDTO>();
        ServiceUser currentUser;
        for(Holiday holiday: list){
            currentUser = holiday.getServiceUser();
            dtoList.add(FlexServiceUtil.rewriteToExtDTO(currentUser, holiday));
        }

        return dtoList;
    }
    
    public void sendDecision(int holidayId, int decision, String cause){
        Holiday holiday = holidayDAO.getById((long)holidayId);
        holiday.setStatus(holidayStatusMap.get(decision));
        holiday.setCause(cause);

        holidayDAO.updateHolidayStatus(holiday);
    }

    public HolidayExtDTO fetchHoliday(String login, Date date){
        HolidayExtDTO dto = null;
        ServiceUser user = serviceUserDAO.getByLogin(login);
        DateTime dateTime = new DateTime(date);
        dateTime = dateTime.minusMonths(1);
        Holiday holiday = holidayDAO.getHolidayForDate(dateTime, user);

        dto = FlexServiceUtil.rewriteToExtDTO(user, holiday);
        return dto;
    }

    private Holiday.HolidayStatus getStatus(int i){
        switch (i) {
            case 0: return Holiday.HolidayStatus.APPLIED;
            case 1: return Holiday.HolidayStatus.APPROVED;
            case 2: return Holiday.HolidayStatus.REJECTED;
        }
        return Holiday.HolidayStatus.APPLIED;
    }

    @Override
    public void createNewUser(ServiceUserDTO serviceUserDTO) {
        ServiceUser serviceUser = FlexServiceUtil.rewriteToEntity(serviceUserDTO);
        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        serviceUser.setPassword(encoder.encodePassword(serviceUser.getPassword(), serviceUser.getLogin()));
        serviceUserDAO.createUser(serviceUser);
    }

    @Override
    public String acceptHoliday(HolidayDTO holidayDTO) {

        Holiday holiday = FlexServiceUtil.rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.APPROVED);
        holidayDAO.updateHolidayStatus(holiday);

        sendNotificationEmail(holiday);
        return "success";
    }

    @Override
    public String rejectHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = FlexServiceUtil.rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.REJECTED);
        holidayDAO.updateHolidayStatus(holiday);

        sendNotificationEmail(holiday);
        return "success";
    }

    @Override
    public List<HolidayDTO> findDataForChosenUser(String login) {
        ServiceUser serviceUser = serviceUserDAO.getByLogin(login);
        List<Holiday> holidays = holidayDAO.findHolidayWithStatus(serviceUser, Holiday.HolidayStatus.APPLIED);
        List<HolidayDTO> holidayDTOs = new ArrayList<HolidayDTO>();
        for (Holiday holiday : holidays) {
            holidayDTOs.add(FlexServiceUtil.rewriteToDTO(holiday));
        }
        return holidayDTOs;
    }

    private void sendNotificationEmail(Holiday holiday) {
        Holiday fullHolidayObject = holidayDAO.getById(holiday.getId());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ServiceUser byUser = ((TestAppUserDetails)auth.getPrincipal()).getServiceUser();
        emailSender.sendHolidayStatusChangedByChiefMail(fullHolidayObject.getStatus(), fullHolidayObject.getDateFrom(), fullHolidayObject.getDateTo(), fullHolidayObject.getServiceUser(), byUser);
    }
}
