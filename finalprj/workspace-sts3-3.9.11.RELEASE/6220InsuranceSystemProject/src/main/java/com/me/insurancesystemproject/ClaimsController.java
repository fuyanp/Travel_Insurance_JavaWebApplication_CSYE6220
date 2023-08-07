package com.me.insurancesystemproject;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.me.dao.ClaimsDAO;
import com.me.pojo.Claims;

public class ClaimsController {

	@Autowired
	@Qualifier("claims")
	Claims claim;

	@RequestMapping(value = "/getallclaims.htm", method = RequestMethod.POST)
	@ResponseBody
	public String getAllClaims(Model model, HttpServletRequest request, HttpServletResponse response,
			ClaimsDAO claimsdao) {
		List<Claims> claimlist;
		if (request.getParameter("identity").equals("client")) {
			claimlist = claimsdao.getAllInsurancesofClient(Integer.parseInt(request.getParameter("rqclientid")));
		} else {
			claimlist = claimsdao.getAllInsurancesofemployee(Integer.parseInt(request.getParameter("rqemployeeid")));

		}
		Gson gson = new Gson();
		String claimjson = gson.toJson(claimlist);
		return claimjson;
	}

	@RequestMapping(value = "/getclaim.htm", method = RequestMethod.POST)
	@ResponseBody
	public String getClaim(Model model,HttpServletRequest request,
            HttpServletResponse response,ClaimsDAO claimsdao) {
		claim=claimsdao.getClaim(Integer.parseInt(request.getParameter("cliamid")));
		Gson gson=new Gson();
		String policyjson=gson.toJson(claim);
		//model.addAttribute("curclient", c );
		
		return policyjson;
	}
	
	@RequestMapping(value = "/addclaim.htm", method = RequestMethod.POST)
	@ResponseBody
	public String addClaim(Model model,HttpServletRequest request,
            HttpServletResponse response,ClaimsDAO claimsdao) {
		claim=new Claims();
		claim.setClientId(Integer.parseInt(request.getParameter("clientId")));
		claim.setClaimDate(request.getParameter("claimDate"));
		claim.setClaimDescription(request.getParameter("claimDescription"));
		claim.setEmpId(Integer.parseInt(request.getParameter("empId")));
		claim.setStatus(request.getParameter("status"));
		claimsdao.saveClaim(claim);
				return "success";
		
	}
	
	@RequestMapping(value = "/updateclaim.htm", method = RequestMethod.POST)
	@ResponseBody
	public String updateClaim(Model model,HttpServletRequest request,
            HttpServletResponse response,ClaimsDAO claimsdao) {
		claim=new Claims();
		claim.setClaimId(Integer.parseInt(request.getParameter("claimId")));
		claim.setClientId(Integer.parseInt(request.getParameter("clientId")));
		claim.setClaimDate(request.getParameter("claimDate"));
		claim.setClaimDescription(request.getParameter("claimDescription"));
		claim.setEmpId(Integer.parseInt(request.getParameter("empId")));
		claim.setStatus(request.getParameter("status"));
		claimsdao.updateClaims(claim);
				return "success";
		
	}
}
