package test.primaris.service.impl;


import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.primaris.dao.HolidayDAO;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;
import test.primaris.entity.dto.ServiceUserDTO;
import test.primaris.security.TestAppUserDetails;
import test.primaris.service.AdminDataService;
import test.primaris.service.util.FlexServiceUtil;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service("adminDataService")
@Transactional
@RemotingDestination
public class AdminDataServiceImpl implements AdminDataService {
    @Autowired
    private HolidayDAO holidayDAO;

    @Autowired
    private ServiceUserDAO serviceUserDAO;
    
    public List<ServiceUserDTO> getUserNames(int year, int month) {
        List<ServiceUserDTO> userList = new ArrayList<ServiceUserDTO>();

        DateTime startingDate = new DateTime(year, month, 1, 0, 0);
        DateTime endingDate = new DateTime(year, month+1, 1, 0, 0);

        List<Holiday> monthlyHolidayList = holidayDAO.findHolidaysInRange(startingDate, endingDate);

        Set<String> loginSet = new HashSet<String>();
        String login;
        for(Holiday holiday: monthlyHolidayList){
            login = holiday.getServiceUser().getLogin();
            if(!loginSet.contains(login)){
                loginSet.add(login);
            }
        }

        // Do FLEX'a trzeba wyslac DTO
        ServiceUser currentUser;
        for(String currentLogin: loginSet){
            currentUser = serviceUserDAO.getByLogin(currentLogin);
            userList.add(FlexServiceUtil.rewriteToDTO(currentUser));
        }

        return userList;
    }
    
    public List<HolidayDTO> getEntriesForMonth(int year, int month){
        DateTime startingDate = new DateTime(year, month, 1, 0, 0);
        DateTime endingDate = new DateTime(year, month+1, 1, 0, 0);

        List<Holiday> list = holidayDAO.findHolidaysInRange(startingDate, endingDate);
        
        List<HolidayDTO> dtoList = new ArrayList<HolidayDTO>();
        for(Holiday holiday: list){
            dtoList.add(FlexServiceUtil.rewriteToDTO(holiday));
        }

        return dtoList;
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
        /*dodane bo metody nie chciały wywoływać handler'ów przy typie metody 'void'*/
        return "success";
    }

    @Override
    public String rejectHoliday(HolidayDTO holidayDTO) {
        Holiday holiday = FlexServiceUtil.rewriteToEntity(holidayDTO);
        holiday.setStatus(Holiday.HolidayStatus.REJECTED);
        holidayDAO.updateHolidayStatus(holiday);
        /*dodane bo metody nie chciały wywoływać handler'ów przy typie metody 'void'*/
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
}
