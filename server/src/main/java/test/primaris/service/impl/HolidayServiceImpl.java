package test.primaris.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.primaris.dao.HolidayDAO;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.service.HolidayService;

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

    @Override
    public Holiday getHolidayById(Long id) {
        return holidayDAO.getById(id);
    }

    @Override
    public List<Holiday> findHolidayForCurrentUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String userLogin = auth.getName();
        ServiceUser user = serviceUserDAO.getByLogin(userLogin);
        return holidayDAO.findHolidayForUser(user);
    }
}
