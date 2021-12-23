package com.PS11390_NguyenTungNhatLinh_ASM.interceptor;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

@Component
public class UrlLocaleInterceptor implements HandlerInterceptor {

	   @Override
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	           throws Exception {

	       LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);

	       if (localeResolver == null) {
	           throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
	       }

	       // Get Locale from LocaleResolver
	       Locale locale = localeResolver.resolveLocale(request);

	       localeResolver.setLocale(request, response, locale);

	       return true;
	   }

	}