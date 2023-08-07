package com.me.insurancesystemproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.me.dao.InsuranceDAO;
import com.me.pojo.Insurance;
@Controller
public class InsuranceController {

	@Autowired
	@Qualifier("insurances")
	Insurance cl;
	
	@RequestMapping(value = "/getallinsurance.htm", method = RequestMethod.POST)
	@ResponseBody
	public String getAllInsurance(Model model,HttpServletRequest request,
            HttpServletResponse response,InsuranceDAO policydao) {
		List<Insurance> cl=policydao.getAllInsurancesofClient(Integer.parseInt(request.getParameter("rqclientid")));
		Gson gson=new Gson();
		String policyjson=gson.toJson(cl);
		//model.addAttribute("curclient", c );
		
		return policyjson;
	}
	
	@RequestMapping(value = "/getinsurance.htm", method = RequestMethod.POST)
	@ResponseBody
	public String getInsurance(Model model,HttpServletRequest request,
            HttpServletResponse response,InsuranceDAO policydao) {
		cl=policydao.getInsurance(request.getParameter("policyid"));
		Gson gson=new Gson();
		String policyjson=gson.toJson(cl);
		//model.addAttribute("curclient", c );
		
		return policyjson;
	}
	
	@RequestMapping(value = "/buyinsurance.htm", method = RequestMethod.POST)
	@ResponseBody
	public String buyInsurance(Model model,HttpServletRequest request,
            HttpServletResponse response,InsuranceDAO policydao) {
		
		cl=new Insurance();
		cl.setType(request.getParameter("type"));
		cl.setAddress(request.getParameter("address"));
		cl.setClientId(Integer.parseInt(request.getParameter("clientId")));
		cl.setCovered(request.getParameter("covered"));
		cl.setDeductible(Integer.parseInt(request.getParameter("deductible")));
		cl.setEid(Integer.parseInt(request.getParameter("eid")));
		cl.setEndDate(request.getParameter("endDate"));
		cl.setStartDate(request.getParameter("startDate"));
		cl.setNameofinsured(request.getParameter("nameofinsured"));
		cl.setStatus(request.getParameter("status"));
		
		policydao.saveInsurance(cl);
		//Gson gson=new Gson();
		//String policyjson=gson.toJson(cl);
		//model.addAttribute("curclient", c );
		
		return "success";
	}
	
	@RequestMapping(value = "/updateinsurance.htm", method = RequestMethod.POST)
	@ResponseBody
	public String updateInsurance(Model model,HttpServletRequest request,
            HttpServletResponse response,InsuranceDAO policydao) {
		
		cl=new Insurance();
		cl.setId(request.getParameter("id"));
		cl.setType(request.getParameter("type"));
		cl.setAddress(request.getParameter("address"));
		cl.setClientId(Integer.parseInt(request.getParameter("clientId")));
		cl.setCovered(request.getParameter("covered"));
		cl.setDeductible(Integer.parseInt(request.getParameter("deductible")));
		cl.setEid(Integer.parseInt(request.getParameter("eid")));
		cl.setEndDate(request.getParameter("endDate"));
		cl.setStartDate(request.getParameter("startDate"));
		cl.setNameofinsured(request.getParameter("nameofinsured"));
		cl.setStatus(request.getParameter("status"));
		
		policydao.updateInsurance(cl);
		//Gson gson=new Gson();
		//String policyjson=gson.toJson(cl);
		//model.addAttribute("curclient", c );
		
		return "success";
	}
}
