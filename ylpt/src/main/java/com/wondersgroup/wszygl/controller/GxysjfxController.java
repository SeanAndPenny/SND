package com.wondersgroup.wszygl.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.GxysjfxManger;
import com.wondersgroup.wszygl.model.GxysjfxModel;
@Component
@RequestMapping("/gxysjfx")
public class GxysjfxController extends BaseMybatisController<GxysjfxModel,String>{
	@Autowired
    public GxysjfxManger gxysjfxManger; 
	@RequestMapping("/gxysjfx")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		
		 SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date(System.currentTimeMillis());
	        Calendar cale = Calendar.getInstance(); 
	        cale = Calendar.getInstance();  
	        cale.add(Calendar.MONTH, 0);  
	        cale.set(Calendar.DAY_OF_MONTH, 1); 
	    String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate");
		String yljgdm = request.getParameter("p_yljgdm");
		
		if(startdate=="" || startdate==null) {
			startdate= formatter.format(cale.getTime()); 	
		};
		if(enddate=="" || enddate==null) {
			enddate= formatter.format(date); 	
		}
		result.setViewName("wszygl/gxysjfx");
		try { 
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("yljgdm", yljgdm); 
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			//高血压压信息来源分析
			List<GxysjfxModel>gxysjLyfxList= gxysjfxManger.getGxysjLyfx(startdate,enddate,yljgdm);
		     result.addObject("gxysjLyfxList", gxysjLyfxList);
		     
		     List<String> xxlybmList = new ArrayList<String>(); 
		    for(int i=0;i<gxysjLyfxList.size();i++) {
		    	xxlybmList.add("'"+gxysjLyfxList.get(i).getXxlybm()+"'");
		    }
		    request.setAttribute("xxlybmList", xxlybmList);
		   //高血压是否抽烟
		    List<GxysjfxModel>gxyXyfxList= gxysjfxManger.getGxyXyfxList(startdate,enddate,yljgdm);
		    result.addObject("gxyXyfxList", gxyXyfxList);
		    List<String> sfxyList = new ArrayList<String>(); 
		    for(int i=0;i<gxyXyfxList.size();i++) {
		    	sfxyList.add("'"+gxyXyfxList.get(i).getSfxy()+"'");
		    }
		    request.setAttribute("sfxyList", sfxyList);
		    //高血压危险分层统计
		    List<GxysjfxModel>gxyWxFcList= gxysjfxManger.getGxyWxFcList(startdate,enddate,yljgdm);
		    result.addObject("gxyWxFcList", gxyWxFcList);
		    List<String> wxfcList = new ArrayList<String>(); 
		    for(int i=0;i<gxyWxFcList.size();i++) {
		    	wxfcList.add("'"+gxyWxFcList.get(i).getWxfcbm()+"'");
		    }
		    request.setAttribute("wxfcList", wxfcList);
		     
		    //高血压年龄统计
		    List<GxysjfxModel>gxyNlFxList= gxysjfxManger.getGxyNlFx(startdate,enddate,yljgdm);
		    result.addObject("gxyNlFxList", gxyNlFxList);
		    List<String> nllxList = new ArrayList<String>(); 
		    for(int i=0;i<gxyNlFxList.size();i++) {
		    	nllxList.add("'"+gxyNlFxList.get(i).getNllx()+"'");
		    }
		    request.setAttribute("nllxList", nllxList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	
	@Override
	public Class<GxysjfxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<GxysjfxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
