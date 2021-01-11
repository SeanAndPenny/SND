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
import com.wondersgroup.wszygl.manager.JtysManger;
import com.wondersgroup.wszygl.model.JtysModel;


@Controller
@RequestMapping("/jtys")
public class JtysfwbController  extends BaseMybatisController<JtysModel,String>{
	@Autowired
	public JtysManger jtysManger;
	@RequestMapping("/jtysfwb")
	public ModelAndView rycxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
			
		try {
			List<JtysModel> jtysFwbList = jtysManger.getJtywFwb();
			result.addObject("jtysFwbList", jtysFwbList);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			 
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	@RequestMapping("/jtystd")
	public ModelAndView jtystdList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
			
		try {
			List<JtysModel> jtystdList = jtysManger.getJtywTd();
			result.addObject("jtystdList", jtystdList);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			 
		}catch(Exception e) {
			logger.warn(e.getMessage());
			result.addObject("code", 500);
			result.addObject("msg", e.getMessage());
		}
		return result;

	}
	
	@RequestMapping("/jtysjg")
	public ModelAndView jtysjgList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView();
			
		try {
			List<JtysModel> jtysJgList = jtysManger.getJtywJg();
			result.addObject("jtysJgList", jtysJgList);
			result.addObject("code", 0);
			result.addObject("msg", "success");
			 
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
