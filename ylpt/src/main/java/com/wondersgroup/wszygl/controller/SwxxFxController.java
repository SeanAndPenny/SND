package com.wondersgroup.wszygl.controller;

 
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.SwxxFxManger;
import com.wondersgroup.wszygl.manager.XxxManger;
import com.wondersgroup.wszygl.model.SwxxFxModel;
import com.wondersgroup.wszygl.model.SwxxJgdmModel;
import com.wondersgroup.wszygl.model.ZhjgUserModel;

@Controller
@RequestMapping("/swxxfx")

public class SwxxFxController extends BaseMybatisController<SwxxFxModel,String>{
	@Autowired
	public SwxxFxManger swxxfxManger;
	@Autowired 
	public XxxManger xxxmanger;
	@RequestMapping("/swxxfx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String ksnf = request.getParameter("p_ksnf");
		String jsnf = request.getParameter("p_jsnf"); 
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx=null;
		try {
		if(ksnf==null||("undefined").equals(ksnf)) {
			ksnf=swxxfxManger.getMinSwsj();
		}
		if(jsnf==null||("undefined").equals(jsnf)) {
			jsnf=swxxfxManger.getMaxSwsj();
		}
		if(ksnf.length()==10) {
			sjlx="day";
		}else if(ksnf.length()==7) {
			sjlx="month";
		}else if(ksnf.length()==4) {
			sjlx="year";
		}
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} 
		try {/// 权限测试
			String userName = null;
			userName = request.getParameter("p_Username");
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			 HttpSession session = httpRequest.getSession();
			if (userName == "" || userName == null) {
				userName = (String) session.getAttribute("loginname1");
			}
		 System.out.println("userName==="+userName);
			if (("").equals(jgdm) || jgdm == null) {
				List<ZhjgUserModel> qx = xxxmanger.getQx(userName);
				for (int i = 0; i < qx.size(); i++) {
					if (("111").equals(qx.get(i).getOrgId()) || ("101000").equals(qx.get(i).getOrgId())) {
						jgdm = "";
					} else {
						jgdm = qx.get(i).getOrgCode();
					}
					result.addObject("orgid", qx.get(i).getOrgId());
				}

			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		try { 
			 List<SwxxFxModel> swxxfxList = swxxfxManger.getswxxfx(ksnf,jsnf,jgdm);//死亡年份分析
			 List<SwxxFxModel> swxxnldfxList = swxxfxManger.getswxxnldfx(ksnf,jsnf,jgdm); //死亡年份_年龄段分析
			 List<SwxxFxModel> syfxnlList = swxxfxManger.getSyfxnlList(ksnf,jsnf,jgdm,sjlx); //死因_年龄段分析
			 List<SwxxFxModel> syflfxList = swxxfxManger.getsyflfxList(ksnf,jsnf,jgdm,sjlx); //死因_分类分析
			 
			 List<SwxxJgdmModel>swjdList=swxxfxManger.getswjdList(jgdm);
			
			  result.addObject("swxxfxList", swxxfxList);	 
				result.addObject("swxxnldfxList", swxxnldfxList);
				result.addObject("swjdList", swjdList);
				result.addObject("syfxnlList", syfxnlList);
				result.addObject("syflfxList", syflfxList);
				result.addObject("ksnf", ksnf);
				result.addObject("jsnf", jsnf);
				result.addObject("jgdm", jgdm);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/swxxfx");		
		return result;
	}
	
	@RequestMapping("/swxxfx2")
	public ModelAndView rycxList2(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String ksnf = request.getParameter("p_ksnf");
		String jsnf = request.getParameter("p_jsnf"); 
		String jgdm = request.getParameter("p_yljgdm");
		String sjlx=null;
		try {
		if(ksnf==null||("undefined").equals(ksnf)) {
			ksnf=swxxfxManger.getMinSwsj();
		}
		if(jsnf==null||("undefined").equals(jsnf)) {
			jsnf=swxxfxManger.getMaxSwsj();
		}
		if(ksnf.length()==10) {
			sjlx="day";
		}else if(ksnf.length()==7) {
			sjlx="month";
		}else if(ksnf.length()==4) {
			sjlx="year";
		}
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		} 
		try {/// 权限测试
			String userName = null;
			userName = request.getParameter("p_Username");
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			 HttpSession session = httpRequest.getSession();
			if (userName == "" || userName == null) {
				userName = (String) session.getAttribute("loginname1");
			}
		 System.out.println("userName==="+userName);
			if (("").equals(jgdm) || jgdm == null) {
				List<ZhjgUserModel> qx = xxxmanger.getQx(userName);
				for (int i = 0; i < qx.size(); i++) {
					if (("111").equals(qx.get(i).getOrgId()) || ("101000").equals(qx.get(i).getOrgId())) {
						jgdm = "";
					} else {
						jgdm = qx.get(i).getOrgCode();
					}
					result.addObject("orgid", qx.get(i).getOrgId());
				}

			}
		} catch (Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		
		try { 
			 List<SwxxFxModel> swxxfxList = swxxfxManger.getswxxfx(ksnf,jsnf,jgdm);//死亡年份分析
			  result.addObject("swxxfxList", swxxfxList);	 
				result.addObject("ksnf", ksnf);
				result.addObject("jsnf", jsnf);
				result.addObject("jgdm", jgdm);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		result.setViewName("wszygl/swxxfx");		
		return result;
	}
	
	
	@RequestMapping("/swxxfxechars")//getechart03
	public ModelAndView getSsywjcecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/swxxfxechars");	
	 
		String nf=request.getParameter("p_nf");
		String jgdm=request.getParameter("p_jgdm");
		List<SwxxFxModel>swxxfxecharsList=swxxfxManger.getSwechats(nf,jgdm);
		 
		
		result.addObject("swxxfxecharsList", swxxfxecharsList);
		 
		return result;
		
	}
	
	@RequestMapping("/getechars06")
	public ModelAndView getechars06(HttpServletRequest request,HttpServletResponse response) {
		 ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/swxxgetechars06");	
	 
		String sjlx =null;
		String ksnf = request.getParameter("p_ksnf");
		String jsnf = request.getParameter("p_jsnf"); 
		String jgdm = request.getParameter("p_yljgdm");
        String nldbm=request.getParameter("p_nldbm");
		String[] nldbmList = nldbm.split("~");
	    String nldbm1=nldbmList[0];
		String nldbm2=nldbmList[1];
		if(ksnf.length()==10) {
			sjlx="day";
		}else if(ksnf.length()==7) {
			sjlx="month";
		}else if(ksnf.length()==4) {
			sjlx="year";
		}
		//chars06
		List<SwxxFxModel>getechars06List=swxxfxManger.getechars06(ksnf,jsnf,jgdm,nldbm1,nldbm2,sjlx);
		//chart07
		List<SwxxFxModel>getechars07List=swxxfxManger.getechars07(ksnf,jsnf,jgdm,nldbm1,nldbm2,sjlx);
		result.addObject("getechars06List", getechars06List);
		result.addObject("getechars07List", getechars07List);
	 
		
		return result;
		 
		
	}
	@RequestMapping("/getechars09")
	public ModelAndView getechars09(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		String sjlx =null;
		String ksnf = request.getParameter("p_ksnf");
		String jsnf = request.getParameter("p_jsnf"); 
		String jgdm = request.getParameter("p_yljgdm");
        String jbbm=request.getParameter("p_jbbm"); 
		if(ksnf.length()==10) {
			sjlx="day";
		}else if(ksnf.length()==7) {
			sjlx="month";
		}else if(ksnf.length()==4) {
			sjlx="year";
		}
	
		List<SwxxFxModel>getechars09List=swxxfxManger.getechars09(ksnf,jsnf,jgdm,jbbm,sjlx);
		result.addObject("getechars09List", getechars09List);
		result.setViewName("wszygl/swxxgetechars09");	
		
		return result;
		
	}
	
	 

	@RequestMapping("/getquery")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String jbflbm = request.getParameter("p_jbflbm");
		String nldbm = request.getParameter("p_nldbm");
		String jgdm = request.getParameter("p_jgdm");
		String ksnf = request.getParameter("p_ksnf");
		String jsnf = request.getParameter("p_jsnf");
		 
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<SwxxFxModel> page = swxxfxManger.pageSelect(pageRequest);
			
			result.addObject("jbflbm", jbflbm);
			result.addObject("nldbm",nldbm);
			result.addObject("jgdm",jgdm);
			result.addObject("ksnf", ksnf);
			result.addObject("jsnf", jsnf);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
			result.setViewName("wszygl/jkdaglfx");
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		 
		return result;

	}
	
	@Override
	public Class<SwxxFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<SwxxFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
