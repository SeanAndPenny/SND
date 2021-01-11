package com.wondersgroup.wszygl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wondersgroup.api.mybatis.manager.BaseMybatisManager;
import com.wondersgroup.frame.spr_mybt_mvc.basic.controller.BaseMybatisController;
import com.wondersgroup.wszygl.model.YqjgzsDaoModel;


@Controller
@RequestMapping("/ys")
//趋势分析
public class ysController extends BaseMybatisController<YqjgzsDaoModel, String> {
	 
	@RequestMapping("/ys")
	public ModelAndView basyxzList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView result = new ModelAndView(); 
		result.setViewName("wszygl/ys");
		return result;
		
	}
	
	 
	

	@Override
	public Class<YqjgzsDaoModel> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BaseMybatisManager<YqjgzsDaoModel, String> getBaseManager() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getViewPath() {
		// TODO Auto-generated method stub
		return null;
	}

}
