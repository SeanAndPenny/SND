package com.wondersgroup.commons.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 
import com.wondersgroup.commons.model.TbAuthUser;
 
public class LoginInterceptor extends HandlerInterceptorAdapter {
 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
 
	/* @Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
        String url = request.getServletPath();    
        System.out.println("post URL："+url);
        if(!url.equals("")){
        	 
                response.sendRedirect("http://10.10.100.173:8080/login.jsp");
                return false;
            
        }
        return true;
	}  
	*/
	
}
