package test.primaris.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;
import test.primaris.dao.HolidayDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;

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
    public List<Holiday> findHolidayForUser(ServiceUser serviceUser) {
        Criteria holidayLoginCriteria = getSession().createCriteria(Holiday.class);
        holidayLoginCriteria.add(Restrictions.eq("serviceUser", serviceUser));
        return holidayLoginCriteria.list();
    }

    @Override
    public List<Holiday> findHolidayWithStatus(ServiceUser serviceUser, Holiday.HolidayStatus status) {
        Criteria holidayLoginStatusCriteria = getSession().createCriteria(Holiday.class);
        holidayLoginStatusCriteria.add(Restrictions.eq("serviceUser", serviceUser));
        holidayLoginStatusCriteria.add(Restrictions.eq("status", status));
        return holidayLoginStatusCriteria.list();
    }

    @Override
    public Long requestHoliday(Holiday holiday) {
        return (Long)getHibernateTemplate().save(holiday);
    }

    @Override
    public List<Holiday> findHolidayForUserAndBetweenDates(DateTime dateTimeBefore, DateTime dateTimeAfter, ServiceUser user) {
        Criteria holidayDateCriteria = getSession().createCriteria(Holiday.class);
        holidayDateCriteria.add(Restrictions.eq("serviceUser", user));
        holidayDateCriteria.add(Restrictions.ge("dateTo", dateTimeBefore));
        holidayDateCriteria.add(Restrictions.le("dateFrom", dateTimeAfter));
        return holidayDateCriteria.list();
    }

    @Override
    public void updateHolidayStatus(Holiday holiday) {
        Query query = getSession().createQuery("update Holiday set status = :currentStatus" +
                " where id = :idNumber");
        query.setParameter("currentStatus", holiday.getStatus());
        query.setParameter("idNumber", holiday.getId());
        int result = query.executeUpdate();
    }
}
