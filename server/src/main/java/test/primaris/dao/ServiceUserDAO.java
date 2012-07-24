package test.primaris.dao;

import test.primaris.entity.ServiceUser;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 14:59
 * To change this template use File | Settings | File Templates.
 */
public interface ServiceUserDAO {
    ServiceUser getById(Long id);
}
