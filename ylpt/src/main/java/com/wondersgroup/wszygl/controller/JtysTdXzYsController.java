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
import com.wondersgroup.wszygl.manager.JtysTdXzYsManger;
import com.wondersgroup.wszygl.model.JtysModel;
 
 
@Component
@RequestMapping("/jtysTdXzYs")
public class JtysTdXzYsController extends BaseMybatisController<JtysModel,String>{
	@Autowired
    public  JtysTdXzYsManger jtysTdXzYsManger;
	
	@RequestMapping("/jtysTdXzYs")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		String tdbh = request.getParameter("p_tdbh"); 
		ModelAndView result = new ModelAndView();
		result.setViewName("wszygl/jtysTdXzYs");
		try { 
			result.addObject("tdbh", tdbh);
		    result.addObject("code", 0);
			result.addObject("msg", "success");
			List<JtysModel>jtysTdXzYsList = jtysTdXzYsManger.getJtysTdXzYs(tdbh);
			result.addObject("jtysTdXzYsList", jtysTdXzYsList);
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	//家庭医生签约患者信息
	@RequestMapping("/jtysTdXzHz")
	public ModelAndView jtysTdXzHzList(HttpServletRequest request, HttpServletResponse response) {
		String  ysid = request.getParameter("p_ysid"); 
		String  tdid = request.getParameter("p_tdid");
		ModelAndView result = new ModelAndView();
		try {  
			PageRequest pageRequest = newPageRequest(request);
			PageResult<JtysModel> page = jtysTdXzYsManger.pageSelect(pageRequest);
			result.addObject("ysid", ysid);
			result.addObject("tdid", tdid);
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
