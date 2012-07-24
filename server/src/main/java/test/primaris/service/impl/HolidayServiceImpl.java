package test.primaris.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.primaris.dao.HolidayDAO;
import test.primaris.entity.Holiday;
import test.primaris.service.HolidayService;

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

    @Override
    public Holiday getHolidayById(Long id) {
        return holidayDAO.getById(id);
    }
}
