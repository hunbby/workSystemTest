package com.kimi.workstm.common.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class CommonExcpetionResolver extends SimpleMappingExceptionResolver {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		
//		디버깅용
		System.out.println("error#################################");
		ex.printStackTrace();
		System.out.println("error#################################");
		
		return super.resolveException(request, response, handler, ex);
	}
	
	

}
