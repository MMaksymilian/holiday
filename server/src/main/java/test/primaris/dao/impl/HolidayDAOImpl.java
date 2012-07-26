package test.primaris.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import test.primaris.dao.HolidayDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: USER
 * Date: 23.07.12
 * Time: 15:41
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class HolidayDAOImpl extends BaseDAOImpl implements HolidayDAO {

    @Override
    public Holiday getById(Long id) {
        Criteria holidayIdCriteria = getSession().createCriteria(Holiday.class);
        holidayIdCriteria.add(Restrictions.idEq(id));
        return (Holiday) holidayIdCriteria.uniqueResult();
    }

    @Override
    public List<Holiday> findHolidayForUser(ServiceUser userLogin) {
        Criteria holidayLoginCriteria = getSession().createCriteria(Holiday.class);
        holidayLoginCriteria.add(Restrictions.in("serviceUser", new ServiceUser[]{userLogin}));
        holidayLoginCriteria.createAlias("serviceUser.holidaySet", "holidays");
        return holidayLoginCriteria.list();
    }
}
