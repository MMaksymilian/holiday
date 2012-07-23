package test.primaris.service.impl;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Service;
import test.primaris.entity.ServiceUser;
import test.primaris.service.ServiceUserService;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
@Service
@RemotingDestination
public class ServiceUserServiceImpl implements ServiceUserService {

    @Override
    public ServiceUser getUserById(Long id) {
        System.out.println("działa");
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
