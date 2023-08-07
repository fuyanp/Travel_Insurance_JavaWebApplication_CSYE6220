package com.me.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.me.pojo.Claims;



@Component
@Repository
public class ClaimsDAO extends DAO {
	
	public void saveClaim(Claims claim) {
		try {
			begin();
			getSession().save(claim);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}

	public Claims getClaim(int id) {
		return getSession().get(Claims.class, id);
	}

	public void deleteClaim(int id) {
		try {
			begin();
			getSession().delete(Claims.class);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}
	
	public void updateClaims(Claims claim) {
		try {
			begin();
			getSession().update(claim);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}
	
	public List<Claims> getAllInsurancesofClient(int clientid){
		return getSession().createQuery("FROM Claims WHERE cusId = "+clientid, Claims.class).getResultList();
		
	}
	
	public List<Claims> getAllInsurancesofemployee(int employeeid){
		return getSession().createQuery("FROM Claims WHERE empId = "+employeeid, Claims.class).getResultList();
		
	}
}
