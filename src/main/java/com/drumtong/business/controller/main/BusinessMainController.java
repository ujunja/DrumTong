package com.drumtong.business.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.main.BusinessMainService;

@Controller
@RequestMapping(value = "business/")
public class BusinessMainController {
	
	@Autowired BusinessMainService svc;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView home() {
		return svc.main();
	}
	
	@GetMapping("login")
	public String loginView() {
		return "business/main/member/businessLogin";
	}
	
	@GetMapping("accountSearch")
	public String accountSearchView() {
		return "business/main/member/businessAccountSearch";
	}

}
