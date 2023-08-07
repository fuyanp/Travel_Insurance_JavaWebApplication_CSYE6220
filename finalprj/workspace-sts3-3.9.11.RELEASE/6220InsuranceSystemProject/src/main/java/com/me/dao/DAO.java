package com.me.dao;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Component
@Repository
public abstract class DAO {
	private static final Logger log = Logger.getAnonymousLogger();
	private static final ThreadLocal threadLocal = new ThreadLocal();
	private static final SessionFactory sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();

    protected DAO() {
    }

    public static Session getSession()
    {
        Session session = (Session) DAO.threadLocal.get();
        
        if (session == null)
        {
            session = sessionFactory.openSession();
            DAO.threadLocal.set(session);
        }
        return session;
    }

    protected void begin() {
        getSession().beginTransaction();
    }

    protected void commit() {
        getSession().getTransaction().commit();
    }

    protected void rollback() {
        try {
            getSession().getTransaction().rollback();
        } catch (HibernateException e) {
            log.log(Level.WARNING, "Cannot rollback", e);
        }
        try {
            getSession().close();
        } catch (HibernateException e) {
            log.log(Level.WARNING, "Cannot close", e);
        }
        DAO.threadLocal.set(null);
    }

    public static void close() {
        getSession().close();
        DAO.threadLocal.set(null);
    }
}
