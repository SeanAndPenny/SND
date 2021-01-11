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
import com.wondersgroup.wszygl.manager.JtysJgxzManger;
import com.wondersgroup.wszygl.model.JtysModel;
@Component
@RequestMapping("/jtysJgxz")
public class JtysJgxzController extends BaseMybatisController<JtysModel,String>{
	@Autowired
    public JtysJgxzManger jtysJgxzManger;
	
	
	@RequestMapping("/jtysJgxz")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
	    String  qyjgid = request.getParameter("p_qyjgid");
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jtysJgxz");
		try { 
			 
			result.addObject("qyjgid", qyjgid);
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JtysModel> page = jtysJgxzManger.pageSelect(pageRequest);
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

	@RequestMapping("/jtysJgxzecharts")
	public ModelAndView ryxzecharts(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
		 String  qyjgid = request.getParameter("p_qyjgid");
		try { 
			result.addObject("qyjgid", qyjgid);
			List<JtysModel>jtysJgxzechartsList = jtysJgxzManger.getJtysFwbXz(qyjgid);
			result.addObject("jtysJgxzechartsList", jtysJgxzechartsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;
		
	}
	
	
	@Override
	public Class<JtysModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<JtysModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
