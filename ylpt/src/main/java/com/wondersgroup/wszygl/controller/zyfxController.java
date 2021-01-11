package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.manager.zyfxManger;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;
import com.wondersgroup.wszygl.model.zyfxModel;

@Controller
@RequestMapping("/zyfx")
public class zyfxController extends BaseMybatisController<zyfxModel, String>{
	@Autowired 
	public zyfxManger zyfxmanger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/zyfx")
	public ModelAndView jkdaglfx(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");  
		String jgdm = request.getParameter("p_yljgdm"); 
		if(kssj==null||("undefined").equals(kssj)) {
			kssj=zyfxmanger.getMinJdsj();
		}
		if(jssj==null||("undefined").equals(jssj)) {
			jssj=zyfxmanger.getMaxJdsj(); 
		}
		try {///权限
			String userName=null;
			 userName = request.getParameter("p_Username");	 
			 if(userName=="" || userName==null) {
					  userName=(String) request.getSession().getAttribute("ssoUsername"); 
				} 
			 System.out.println("jgdm=="+jgdm);
			if(("").equals(jgdm)||jgdm==null) {
				List<ZhjgUserModel> qx=xxxmanger.getQx(userName);
				for(int i=0;i<qx.size();i++) { 
					if(("111").equals(qx.get(i).getOrgId()) || ("101000").equals(qx.get(i).getOrgId())) {
						jgdm="";
					}else {
						jgdm=qx.get(i).getOrgCode();
					}
					result.addObject("orgid", qx.get(i).getOrgId()); 
				}
			}
			}catch(Exception e) {
				logger.warn(e.getMessage());
				result.addObject("code", 500);
				result.addObject("msg", e.getMessage());
			} 
		try {
		List<zyfxModel> zyfxList=zyfxmanger.getzyfx(kssj,jssj,jgdm);
		 List<SwxxJgdmModel>zyjgList=zyfxmanger.getzyjgList(jgdm);
		result.addObject("kssj", kssj);
		result.addObject("jssj", jssj);
		result.addObject("jgdm", jgdm);
		result.addObject("zyfxList", zyfxList);
		result.addObject("zyjgList", zyjgList);
		result.setViewName("wszygl/zyfx");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} 
		return result;
	}
	
	
	@RequestMapping("/zyfxechars")
	public ModelAndView getechars02(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		List<zyfxModel> getechars02List = zyfxmanger.getechars02(kssj, jssj,jgdm);
		result.addObject("getechars02List", getechars02List);
		return result;

	}
	
	
	@RequestMapping("/getechar03")
	public ModelAndView getechars03(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String kssj = request.getParameter("p_kssj");
		String jssj = request.getParameter("p_jssj");
		String jgdm = request.getParameter("p_yljgdm");
		List<zyfxModel> getechars03List = zyfxmanger.getechars03(kssj, jssj,jgdm);
		result.addObject("getechars03List", getechars03List);
		return result;

	}
	
	
	
	@Override
	public Class<zyfxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<zyfxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

	 
}
