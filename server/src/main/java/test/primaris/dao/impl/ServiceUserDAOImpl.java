package test.primaris.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import test.primaris.dao.ServiceUserDAO;
import test.primaris.entity.ServiceUser;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:41
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class ServiceUserDAOImpl extends BaseDAOImpl implements ServiceUserDAO {

    @Override
    public ServiceUser getById(Long id) {
        Criteria serviceUserIdCriteria = getSession().createCriteria(ServiceUser.class);
        serviceUserIdCriteria.add(Restrictions.idEq(id));
        return (ServiceUser) serviceUserIdCriteria.uniqueResult();
    }
}
