package com.drumtong.business.controller.submanagement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.submanagement.BusinessSubManagementService;

@Controller
@RequestMapping("business/submanagement/")
public class BusinessSubManagementController {

	@Autowired BusinessSubManagementService svc;
	
	// 비즈니스 리뷰관리 페이지로 이동 (GET) [영경]
	@RequestMapping(value="businessReviewManagement/", method = RequestMethod.GET)
	public ModelAndView reviewManagement(HttpServletRequest req) {
		HttpSession Session = req.getSession();
		String pageKind = (String)Session.getAttribute("pageKind");
		String pageNum = (String)Session.getAttribute("pageNum");
		Session.removeAttribute("pageKind");
		Session.removeAttribute("pageNum");
		return svc.reviewManagement(req, pageKind, pageNum);
	}
	
	// 비즈니스 리뷰관리 페이지 번호 이동(GET) [영경]
	@RequestMapping(value="businessReviewManagement/{pageKind}/{pageNum}/", method = RequestMethod.GET)
	public ModelAndView reviewManagement(HttpServletRequest req, @PathVariable("pageKind")String pageKind, @PathVariable("pageNum")String pageNum) {
		HttpSession Session = req.getSession();
		Session.setAttribute("pageKind", pageKind);
		Session.setAttribute("pageNum", pageNum);
		return new ModelAndView("redirect:/business/submanagement/businessReviewManagement/");
	}
	
	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [영경]
	@RequestMapping(value="businessCouponManagement/", method = RequestMethod.GET)
	public ModelAndView couponManagement(HttpServletRequest req) {
		return svc.couponManagement(req);
	}

	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessCardAccountManagement/", method = RequestMethod.GET)
	public ModelAndView cardAccountManagement(HttpServletRequest req) {
		return svc.cardAccountManagement(req);
	}
	

	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessStatisticsManagement/", method = RequestMethod.GET)
	public ModelAndView statisticsManagement(HttpServletRequest req) {
		return svc.statisticsManagement(req);
	}

	// 비즈니스 주문관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessOrderStatusManagement/", method = RequestMethod.GET)
	public ModelAndView orderStatusManagement(HttpServletRequest req) {
		return svc.orderStatusManagement(req);
	}
	
	
	



}
