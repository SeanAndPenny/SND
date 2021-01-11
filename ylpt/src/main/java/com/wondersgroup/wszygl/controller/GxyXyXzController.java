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
import com.wondersgroup.wszygl.manager.GxyXyXzManger;
import com.wondersgroup.wszygl.model.GxysjfxModel;
@Component
@RequestMapping("/gxyXyXz")
public class GxyXyXzController extends BaseMybatisController<GxysjfxModel,String>{
	@Autowired
    public  GxyXyXzManger gxyXyXzManger;
	@RequestMapping("/gxyXyXz")
	public ModelAndView jjhzjbfxList(HttpServletRequest request, HttpServletResponse response) {
		String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate"); 
		String sfxy = request.getParameter("p_sfxy"); 
		String yljgdm = request.getParameter("p_yljgdm");
		System.out.println("yljgdm=="+yljgdm);
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/gxyXyXz");
		try { 
			List<GxysjfxModel>gxyXyXzList =  gxyXyXzManger.getGxyXyXzList(startdate,enddate,sfxy,yljgdm);
			 result.addObject("gxyXyXzList", gxyXyXzList);
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("yljgdm", yljgdm);
			result.addObject("sfxy", sfxy); 
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
	
	@RequestMapping("/gxyXyXzXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate"); 
		String sfxy = request.getParameter("p_sfxy"); 
		String yljgdm = request.getParameter("p_yljgdm"); 
		 
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<GxysjfxModel> page = gxyXyXzManger.pageSelect(pageRequest);
			
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("sfxy", sfxy);
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
