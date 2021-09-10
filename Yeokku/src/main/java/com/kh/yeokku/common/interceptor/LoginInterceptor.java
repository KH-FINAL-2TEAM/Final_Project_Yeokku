package com.kh.yeokku.common.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.yeokku.model.dto.UserDto;

public class LoginInterceptor implements HandlerInterceptor{

	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("[interceptor] : preHandle");
		
		if(request.getRequestURI().contains("/admin_user.do") || request.getRequestURI().contains("/admin_report.do") 
				|| request.getRequestURI().contains("/admin_qna.do")) 
		{
			if(request.getSession().getAttribute("user") != null) {
				UserDto dto = (UserDto)request.getSession().getAttribute("user");
				
				if(dto.getUser_role().equals("ADMIN")) {
					return true;
				}
				response.sendRedirect("main_form.do");
				return false;
			}else {
				response.sendRedirect("main_form.do");
				return false;
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
