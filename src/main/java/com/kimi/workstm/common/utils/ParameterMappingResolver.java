package com.kimi.workstm.common.utils;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class ParameterMappingResolver implements HandlerMethodArgumentResolver {

	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		boolean result = parameter.getParameterType().equals(CommandMap.class);
		return result;
	}

	@Override
	public Object resolveArgument(MethodParameter methodparameter, ModelAndViewContainer modelandviewcontainer,
			NativeWebRequest webRequest, WebDataBinderFactory webdatabinderfactory) throws Exception {
		CommandMap requestMap = new CommandMap();
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		for (Enumeration<?> enumeration = request.getParameterNames(); enumeration.hasMoreElements();) {
			String key = (String) enumeration.nextElement();
			String[] values = webRequest.getParameterValues(key);
			if (values != null) {
				requestMap.put(key, (values.length > 1) ? values : values[0]);
			}
		}
		return requestMap;
	}

}
