package test.primaris.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.ServiceUserDTO;
import test.primaris.service.ServiceUserService;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:30
 * To change this template use File | Settings | File Templates.
 */
@Service
@Transactional
@RemotingDestination
public class ServiceUserServiceImpl implements ServiceUserService {

    @Autowired
    ServiceUserDAO serviceUserDAO;

//    @PreAuthorize()
    @Override
    public ServiceUserDTO getUserById(Long id) {
        ServiceUser serviceUser = serviceUserDAO.getById(id);
        ServiceUserDTO serviceUserDTO = new ServiceUserDTO();
        /*TODO uzupełnić*/
        return serviceUserDTO;
    }
}
