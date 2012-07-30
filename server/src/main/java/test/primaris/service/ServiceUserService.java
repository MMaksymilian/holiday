package test.primaris.service;

import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.ServiceUserDTO;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:00
 * To change this template use File | Settings | File Templates.
 */
public interface ServiceUserService {

    ServiceUserDTO getUserById(Long id);
}
