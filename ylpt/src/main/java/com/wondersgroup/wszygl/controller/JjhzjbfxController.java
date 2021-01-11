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
import com.wondersgroup.wszygl.manager.JjhzjbfxManger;
import com.wondersgroup.wszygl.model.JjsjFxModel;
/**
 * 急救患者级别分析
 * @author asus
 *
 */
@Component
@RequestMapping("/jjhzjbfx")
public class JjhzjbfxController extends BaseMybatisController<JjsjFxModel,String>{
	@Autowired
    public JjhzjbfxManger jjhzjbfxManger;
	
	@RequestMapping("/jjhzjbfx")
	public ModelAndView jjhzjbfxList(HttpServletRequest request, HttpServletResponse response) {
		String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate");   
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jjhzjbfx");
		try { 
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			
			  List<JjsjFxModel>jjhzjbfxList =null;
			  jjhzjbfxList= jjhzjbfxManger.getJjhzjbfxListList(startdate,enddate);
				result.addObject("jjhzjbfxList", jjhzjbfxList);

		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	@RequestMapping("/jjhzjbfxXx")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  startdate = request.getParameter("p_startdate"); 
		String enddate = request.getParameter("p_enddate"); 
		String fzjb = request.getParameter("p_fzjb"); 
		 
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JjsjFxModel> page = jjhzjbfxManger.pageSelect(pageRequest);
			result.addObject("startdate", startdate);
			result.addObject("enddate", enddate); 
			result.addObject("fzjb", fzjb); 
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
	public Class<JjsjFxModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JjsjFxModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
