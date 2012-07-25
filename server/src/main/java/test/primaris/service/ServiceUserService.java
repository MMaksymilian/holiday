package test.primaris.service;

import test.primaris.entity.ServiceUser;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:00
 * To change this template use File | Settings | File Templates.
 */
public interface ServiceUserService {

    ServiceUser getUserById(Long id);
}
