package com.me.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.me.pojo.Client;


@Component
@Repository
public class ClientDAO extends DAO {

	public void saveClient(Client client) {
		try {
			begin();
			getSession().save(client);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}

	public Client getClient(int id) {
		return getSession().get(Client.class, id);
	}

	public void deleteClient(int id) {
		try {
			Client c=getSession().get(Client.class, id);
			begin();
			getSession().delete(c);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}
	
	public void updateClient(Client client) {
		try {
			begin();
			getSession().update(client);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}
	
	public List<Client> getAllClients(){
		return getSession().createQuery("SELECT a FROM Client a", Client.class).getResultList();
		
	}
}
