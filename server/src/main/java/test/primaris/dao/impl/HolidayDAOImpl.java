package test.primaris.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.joda.time.DateTime;
import org.springframework.stereotype.Repository;
import test.primaris.dao.HolidayDAO;
import test.primaris.entity.Holiday;
import test.primaris.entity.ServiceUser;
import test.primaris.entity.dto.HolidayDTO;

import java.util.Date;
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
        holidayLoginCriteria.addOrder(Order.asc("dateFrom"));
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
        if(dateTimeAfter.equals(dateTimeBefore))  {
            holidayDateCriteria.add(Restrictions.eq("serviceUser", user));
            holidayDateCriteria.add(Restrictions.eq("dateTo", dateTimeBefore));
            holidayDateCriteria.add(Restrictions.eq("dateFrom", dateTimeAfter));
        } else {
            holidayDateCriteria.add(Restrictions.eq("serviceUser", user));
            holidayDateCriteria.add(Restrictions.ge("dateTo", dateTimeBefore));
            holidayDateCriteria.add(Restrictions.lt("dateFrom", dateTimeAfter));
        }
        return holidayDateCriteria.list();
    }

    @Override
    public List<Holiday> findHolidaysInRange(DateTime beginningDate, DateTime endingDate) {
        Criteria holidayDateCriteria = getSession().createCriteria(Holiday.class);

        // DateFrom = <beginningDate, ...)
        holidayDateCriteria.add(Restrictions.ge("dateFrom", beginningDate));

        // DateTo = (..., endingDate>
        holidayDateCriteria.add(Restrictions.le("dateTo", endingDate));

        List<Holiday> list = holidayDateCriteria.list();
        return list;
    }

    @Override
    public List<Holiday> findHolidaysContainingRange(DateTime beginningDate, DateTime endingDate) {
        Criteria holidayDateCriteria = getSession().createCriteria(Holiday.class);

        // DateFrom = (..., beginningDate)
        holidayDateCriteria.add(Restrictions.lt("dateFrom", beginningDate));

        // DateTo = (endingDate, ...)
        holidayDateCriteria.add(Restrictions.gt("dateTo", endingDate));
        List<Holiday> list = holidayDateCriteria.list();
        return list;
    }

    @Override
    public List<Holiday> findHolidaysStartingInRange(DateTime beginningDate, DateTime endingDate) {
        Criteria holidayDateCriteria = getSession().createCriteria(Holiday.class);

        // DateFrom = <beginningDate, endingDate>
        holidayDateCriteria.add(Restrictions.ge("dateFrom", beginningDate));
        holidayDateCriteria.add(Restrictions.lt("dateFrom", endingDate));

        // DateTo = (endingDate, ...)
        holidayDateCriteria.add(Restrictions.ge("dateTo", endingDate));
        List<Holiday> list = holidayDateCriteria.list();
        return list;
    }

    @Override
    public List<Holiday> findHolidaysEndingInRange(DateTime beginningDate, DateTime endingDate) {
        Criteria holidayDateCriteria = getSession().createCriteria(Holiday.class);

        // DateFrom = (..., beginningDate)
        holidayDateCriteria.add(Restrictions.le("dateFrom", beginningDate));

        // DateTo = <beginningDate, endingDate>
        holidayDateCriteria.add(Restrictions.ge("dateTo", beginningDate));
        holidayDateCriteria.add(Restrictions.lt("dateTo", endingDate));
        List<Holiday> list = holidayDateCriteria.list();
        return list;
    }

    @Override
    public Holiday getHolidayForDate(DateTime date, ServiceUser user){
        Criteria criteria = getSession().createCriteria(Holiday.class);

        DateTime endingDate = date.plusDays(1);
        criteria.add(Restrictions.eq("serviceUser", user));
        criteria.add(Restrictions.le("dateFrom", date));
        criteria.add(Restrictions.ge("dateTo", date));

        Holiday holiday = (Holiday) criteria.uniqueResult();
        return holiday;

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
