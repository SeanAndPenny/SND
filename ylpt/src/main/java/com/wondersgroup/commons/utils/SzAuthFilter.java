package com.wondersgroup.commons.utils;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
 
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.context.support.XmlWebApplicationContext;

import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

public class SzAuthFilter implements Filter {
	
	private final static Logger logger = LoggerFactory.getLogger(SzAuthFilter.class);

	private String noInterceptUrl = "";

	private String notLoginUrl = "";

	private String[] noInterceptUrls;

	@Autowired 
	public XxxManger xxxManger; 

	public void init(FilterConfig filterConfig) throws ServletException {
		if (noInterceptUrl == null || "".equals(noInterceptUrl)) {
			noInterceptUrl = filterConfig.getInitParameter("noInterceptUrl");
		}
		if (noInterceptUrl != null) {
			noInterceptUrl = noInterceptUrl.toUpperCase();
		}
		if (notLoginUrl == null || "".equals(notLoginUrl)) {
			notLoginUrl = filterConfig.getInitParameter("notLoginUrl");
		}
		if (noInterceptUrls == null && noInterceptUrl != null) {
			noInterceptUrls = noInterceptUrl.trim().split(",");
		}
	}

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		String requestUri = httpRequest.getRequestURI().toUpperCase();

		boolean isAjax = false;// 是否是ajax
		if ((null != httpRequest.getHeader("X-Requested-With"))
				&& (httpRequest.getHeader("X-Requested-With").equals("XMLHttpRequest"))) {
			isAjax = true;
		}
		boolean match = false;
		if (!ArrayUtils.isEmpty(this.noInterceptUrls)) {
			for (int i = 0; i < this.noInterceptUrls.length; i++) {
				if (requestUri.matches(this.noInterceptUrls[i])) {
					match = true;
					break;
				}
			}
		}
		if (match) {
			chain.doFilter(request, response);
			return;
		}

		//loginname = httpRequest.getParameter("loginname");
		//String pwd = httpRequest.getParameter("pwd"); 
		String loginname ="0614e3b53b895459286f041e75260d71";
		String pwd = "ad182ebe9e49f264";
		//String loginname ="13eb5fa63dea14d6a730133fc4f82d35";
		//String pwd = "4c99a9b57adf66cc";
		
		try {
			System.out.println("SZSHQQGLY="+SzDESUtil.encrypt("SZSHQQGLY"));
			System.out.println("111111=="+SzDESUtil.encrypt("111111"));
			 
		} catch (Exception e1) { 
			e1.printStackTrace();
		}
		logger.warn("获取请求参数loginname:" + loginname );
		logger.warn("获取请求参数pwd:" + pwd );
		
		String msg = "登陆已过期!";
		if(StringUtils.isNoneBlank(loginname) && StringUtils.isNoneBlank(pwd)){
			try {
				String loginname1 = SzDESUtil.decrypt(loginname);
				String pwd1 = SzDESUtil.decrypt(pwd);
				System.out.println("loginname1==="+loginname1);
				System.out.println("pwd1==="+pwd1);
				System.out.println("pwd1==="+MD5Util.getInstance().calcMD5(pwd1));
				ServletContext sc = ((HttpServletRequest) request).getSession().getServletContext();
				XmlWebApplicationContext cxt = (XmlWebApplicationContext)WebApplicationContextUtils.getWebApplicationContext(sc);
				 if(cxt != null && cxt.getBean("xxxManger") != null && xxxManger == null)
					 xxxManger = (XxxManger) cxt.getBean("xxxManger");
				
				ZhjgUserModel user = xxxManger.fakeAuthUserInfo(loginname1, MD5Util.getInstance().calcMD5(pwd1));
				if(user!=null){
					SessionUtils.setZhjgUser(httpRequest, user);
					session.setAttribute("loginname", loginname);
					session.setAttribute("pwd", pwd);
					session.setAttribute("loginname1", loginname1);
					session.setAttribute("pwd1", pwd1);
				}else{
					msg = "用户未同步,无权限访问!";
					System.out.println("msg==="+msg);
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "参数信息有误!";
			}
		}

		ZhjgUserModel user = SessionUtils.getZhjgUser(httpRequest);
		if (user == null) {	
			sendErroMsg(isAjax,httpResponse,notLoginUrl,msg);
		} else {
			chain.doFilter(request, response);
		}
	}
	
	private void sendErroMsg(boolean isAjax,HttpServletResponse httpResponse,String notLoginUrl,String msg) throws IOException{
		 
		if(isAjax){
			httpResponse.setStatus(200);
			httpResponse.setContentType("application/json");
			httpResponse.setCharacterEncoding("UTF-8");
			String json = "{'flag':false, 'msg':'"+msg+"'}";
			httpResponse.getWriter().print(json);
		}else{
			httpResponse.setStatus(403);
			httpResponse.setContentType("text/html; charset=UTF-8");
			httpResponse.setCharacterEncoding("UTF-8");
			httpResponse.getWriter().print("<script>alert('"+msg+"');top.location.href='"+notLoginUrl+"';</script>");
		}
	}

	public String getNoInterceptUrl() {
		return noInterceptUrl;
	}

	public void setNoInterceptUrl(String noInterceptUrl) {
		this.noInterceptUrl = noInterceptUrl;
	}

	public String getNotLoginUrl() {
		return notLoginUrl;
	}

	public void setNotLoginUrl(String notLoginUrl) {
		this.notLoginUrl = notLoginUrl;
	}

	public String[] getNoInterceptUrls() {
		return noInterceptUrls;
	}

	public void setNoInterceptUrls(String[] noInterceptUrls) {
		this.noInterceptUrls = noInterceptUrls;
	}
	
}