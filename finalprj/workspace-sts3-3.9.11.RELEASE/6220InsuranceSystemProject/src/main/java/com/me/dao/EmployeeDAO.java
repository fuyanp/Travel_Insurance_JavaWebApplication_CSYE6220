package com.me.dao;


import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.me.pojo.Employee;

@Component
@Repository
public class EmployeeDAO extends DAO{
	
	
	public void saveEmployee(Employee employee) {
		try {
			begin();
			getSession().save(employee);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}
	
	public Employee getEmployee(int id) {
		return getSession().get(Employee.class, id);
	}
	
	public void deleteEmployee(int id) {
		try {
			Employee e=getSession().get(Employee.class, id);
			begin();
			getSession().delete(e);
			commit();
		} catch (HibernateException e) {
			System.out.print("HibernateException: " + e.getMessage());
			rollback();
		}
	}
	
	public List<Employee> getAllEmployees(){
		return getSession().createQuery("SELECT a FROM Employee a", Employee.class).getResultList();
		
	}
}
