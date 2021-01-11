package com.wondersgroup.wszygl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.wondersgroup.api.beans.page.PageRequest;
import com.wondersgroup.api.beans.page.PageResult;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.manager.GxyWxfcXzManger;
import com.wondersgroup.wszygl.model.GxysjfxModel;
@Component
@RequestMapping("/gxyWxfcXz")
public class GxyWxfcXzController extends BaseMybatisController<GxysjfxModel,String>{
	@Autowired
    public  GxyWxfcXzManger gxyWxfcXzManger;
	@RequestMapping("/gxyWxfcXz")
	public ModelAndView jjhzjbfxList(HttpServletRequest request, HttpServletResponse response) {
		String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate"); 
		String wxfc = request.getParameter("p_wxfc"); 
		String yljgdm = request.getParameter("p_yljgdm");
		
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/gxyWxfcXz");
		try { 
			List<GxysjfxModel>gxyWxfcXzList =  gxyWxfcXzManger.getGxyWxfcXz(startdate,enddate,wxfc,yljgdm);
			 result.addObject("gxyWxfcXzList", gxyWxfcXzList);
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("wxfc", wxfc); 
			result.addObject("yljgdm", yljgdm);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			
			  ;

		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	@RequestMapping("/gxyWxfcXzXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate"); 
		String wxfc = request.getParameter("p_wxfc"); 
		String yljgdm = request.getParameter("p_yljgdm"); 
		 
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<GxysjfxModel> page = gxyWxfcXzManger.pageSelect(pageRequest);
			
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("wxfc", wxfc);
			result.addObject("yljgdm", yljgdm);
			
			result.addObject("code", 0);
			result.addObject("msg", "success");
			result.addObject("count", page.getTotalCount());
			result.addObject("data", page.getResult());
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
