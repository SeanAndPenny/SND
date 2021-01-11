package com.wondersgroup.commons.utils;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.wondersgroup.wszygl.model.ZhjgUserModel;

public class SessionUtils {
	
	public final static String ZHJG_USER="zhjguser";
	public final static String ZHJG_ORG="orgInfo";
	public final static String DATA_SCOPE="dataScopeList";
	public final static String ROLE_IDS="roleIdList";
	public final static String MENU_RESOURCES="menuResourcesList";
	public final static String FUN_RESOURCES="funResourcesList";


	/**
	 * 
	  * @Title: setZhjgUser
	  * @Description:将综合监管用户放入session中
	  * @author: luo bin
	  * @date 2017年6月9日 下午4:52:30
	  * @最后修改人: luo bin
	  * @最后修改时间：2017年6月9日 下午4:52:30
	  * @param request
	  * @param user
	  * @throws
	 */
	public static void setZhjgUser(HttpServletRequest request,ZhjgUserModel user){
		request.getSession(true).setAttribute(SessionUtils.ZHJG_USER, user);
	}
	
	/**
	 * 
	  * @Title: getZhjgUser
	  * @Description:获取综合监管用户信息
	  * @author: luo bin
	  * @date 2017年6月9日 下午4:52:30
	  * @最后修改人: luo bin
	  * @最后修改时间：2017年6月9日 下午4:52:30
	  * @param request
	  * @param user
	  * @throws
	 */
	public static ZhjgUserModel getZhjgUser(HttpServletRequest request){
		return (ZhjgUserModel) request.getSession(true).getAttribute(ZHJG_USER);
	}
	
	public static void setDataScope(HttpServletRequest request,List<Map<String,Object>> dataScopeList){
		request.getSession(true).setAttribute(DATA_SCOPE, dataScopeList);
	}
	
	public static List<Map<String,Object>> getDataScope(HttpServletRequest request){
		return (List<Map<String,Object>>) request.getSession(true).getAttribute(DATA_SCOPE);
	}
	
	public static void setRoleIds(HttpServletRequest request,List<String> roleIdList){
		request.getSession(true).setAttribute(ROLE_IDS, roleIdList);
	}
	
	public static List<String> getRoleIds(HttpServletRequest request){
		return (List<String>) request.getSession(true).getAttribute(ROLE_IDS);
	}
	
	public static void setMenuResources(HttpServletRequest request,List<Map<String,Object>> menuReources){
		request.getSession(true).setAttribute(MENU_RESOURCES, menuReources);
	}
	
	public static List<Map<String,Object>> getMenuResources(HttpServletRequest request){
		return (List<Map<String,Object>>) request.getSession(true).getAttribute(MENU_RESOURCES);
	}


	public static void setZhjgOrg(HttpServletRequest request,Map<String,Object> orgInfo){
		request.getSession(true).setAttribute(ZHJG_ORG, orgInfo);
	}
	
	public static Map<String,Object> getZhjgOrg(HttpServletRequest request){
		return (Map<String,Object>) request.getSession(true).getAttribute(ZHJG_ORG);
	}
	
	
	
	//设置验证码
	public static void setVaditeCode(HttpServletRequest request,String code){
		request.getSession(true).setAttribute("imageCode", code);
	}
	public static String getVaditeCode(HttpServletRequest request){
		return (String) request.getSession(true).getAttribute("imageCode");
	}
	public static void removeVaditeCode(HttpServletRequest request){
		request.getSession(true).removeAttribute("imageCode");
	}
	
}