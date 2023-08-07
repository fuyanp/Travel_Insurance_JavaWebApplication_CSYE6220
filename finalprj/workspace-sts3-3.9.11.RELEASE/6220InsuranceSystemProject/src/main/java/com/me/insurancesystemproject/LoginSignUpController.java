package com.me.insurancesystemproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.me.dao.ClientDAO;
import com.me.dao.EmployeeDAO;
import com.me.pojo.Client;
import com.me.pojo.Employee;

@Controller
public class LoginSignUpController {
	@Autowired
	@Qualifier("clients")
	Client c;
	
	@Autowired
	@Qualifier("Employees")
	Employee e;
	
	@RequestMapping(value = "/clientsignup.htm", method = RequestMethod.POST)
	public String clientSignUp(Model model,HttpServletRequest request,
            HttpServletResponse response,ClientDAO clientdao) {
		c=new Client();
		c.setDateOfBirth(request.getParameter("dob"));
		c.setFirstName(request.getParameter("firstName"));
		c.setLastName(request.getParameter("lastName"));
		c.setGender(request.getParameter("gender"));
		c.setEmail(request.getParameter("email"));
		c.setPhone(request.getParameter("phone"));
		clientdao.saveClient(c);
		 HttpSession s = request.getSession();
	        s.setMaxInactiveInterval(1800);
	        s.setAttribute("curclient", c);
		model.addAttribute("curclient", c );
		
		return "customerhome";
	}
	
	@RequestMapping(value = "/clientsignin.htm", method = RequestMethod.POST)
	public String clientSignIn(Model model,HttpServletRequest request,
            HttpServletResponse response,ClientDAO clientdao) {
		HttpSession s = request.getSession();
        s.setMaxInactiveInterval(1800);
		c=clientdao.getClient(Integer.parseInt(request.getParameter("customerid")));
		if(c!=null) {
			if(c.getPasswrod().equals(request.getParameter("password"))) {
			model.addAttribute("curclient", c );
			s.setAttribute("curclient", c);
			return "customerhome";
			}
		}
		
		model.addAttribute("errormsg", "invalid id/password" );
		return "index";
	}
	
	@RequestMapping(value = "/employeesignin.htm", method = RequestMethod.POST)
	public String employeeSignIn(Model model,HttpServletRequest request,
            HttpServletResponse response,EmployeeDAO employeedao) {
		
		e=employeedao.getEmployee(Integer.parseInt(request.getParameter("employeeid")));
		if(e!=null) {
			if(e.getPassword().equals(request.getParameter("password"))) {
			model.addAttribute("curemployee", e );
			return "employeehome";
			}
		}
		
		model.addAttribute("errormsg", "invalid id/password" );
		return "index";
	}
	
	@RequestMapping(value = "/adminsignin.htm", method = RequestMethod.POST)
	public String adminSignIn(Model model,HttpServletRequest request,
            HttpServletResponse response,EmployeeDAO employeedao,ClientDAO clientdao) {
		
		e=employeedao.getEmployee(Integer.parseInt(request.getParameter("employeeid")));
		if(e!=null) {
			if(e.getPassword().equals(request.getParameter("password"))) {
			model.addAttribute("curadmin", e );
			List<Employee> elist=employeedao.getAllEmployees();
			List<Client> clist=clientdao.getAllClients();
			model.addAttribute("employeelist", elist );
			model.addAttribute("clientlist", clist );
			return "adminhome";
			}
		}
		
		model.addAttribute("errormsg", "invalid id/password" );
		return "index";
	}
	
	@RequestMapping(value = "/addemployee.htm", method = RequestMethod.POST)
	public String addEmployee(Model model,HttpServletRequest request,
            HttpServletResponse response,EmployeeDAO employeedao) {
		e=new Employee();
		e.setDateOfBirth(request.getParameter("dob"));
		e.setFirstName(request.getParameter("firstName"));
		e.setLastName(request.getParameter("lastName"));
		e.setGender(request.getParameter("gender"));
		e.setEmail(request.getParameter("email"));
		e.setPhone(request.getParameter("phone"));
		employeedao.saveEmployee(e);
		
		return "adminhome";
	}
}
