package test.primaris.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public abstract class BaseDAOImpl extends HibernateDaoSupport {

    @Autowired
    public void initSessionFactory(SessionFactory sessionFactory) {
        setSessionFactory(sessionFactory);
    }
}
