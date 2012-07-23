package test.primaris.service.impl;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Service;
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
@RemotingDestination
public class HolidayServiceImpl implements HolidayService {

    @Override
    public Holiday getHolidayById(Long id) {
        System.out.println("działa!");
        return null;
    }
}
